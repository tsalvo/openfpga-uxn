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
-- Submodules: 69
entity jci_0CLK_5110df32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_5110df32;
architecture arch of jci_0CLK_5110df32 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l68_c6_5fff]
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l68_c1_9dfa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l68_c2_394e]
signal tmp16_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l68_c2_394e]
signal t8_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l68_c2_394e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l68_c2_394e]
signal result_pc_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l68_c2_394e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l68_c2_394e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l68_c2_394e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l68_c2_394e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l68_c2_394e]
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l69_c3_9452[uxn_opcodes_h_l69_c3_9452]
signal printf_uxn_opcodes_h_l69_c3_9452_uxn_opcodes_h_l69_c3_9452_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l73_c11_d2f3]
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l73_c7_7226]
signal tmp16_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l73_c7_7226]
signal t8_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l73_c7_7226]
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l73_c7_7226]
signal result_pc_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l73_c7_7226]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l73_c7_7226]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l73_c7_7226]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l73_c7_7226]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l73_c7_7226]
signal result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_970d]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_08bf]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_08bf]
signal t8_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l76_c7_08bf]
signal result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_08bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_08bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_08bf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_08bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_08bf]
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l82_c11_fb8e]
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l82_c7_8dfd]
signal tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l82_c7_8dfd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l82_c7_8dfd]
signal result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l82_c7_8dfd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l82_c7_8dfd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l82_c7_8dfd]
signal result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l86_c11_6e2e]
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l86_c7_d859]
signal tmp16_MUX_uxn_opcodes_h_l86_c7_d859_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_d859_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_d859]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l86_c7_d859]
signal result_pc_MUX_uxn_opcodes_h_l86_c7_d859_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l86_c7_d859_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_d859]
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l86_c7_d859]
signal result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l88_c3_f40e]
signal CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l89_c21_18e5]
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l91_c11_85fd]
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l91_c7_d5be]
signal tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_d5be]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l91_c7_d5be]
signal result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_d5be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l91_c7_d5be]
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l92_c21_1cf4]
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c11_09a6]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l94_c7_4fef]
signal tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_4fef]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l94_c7_4fef]
signal result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_4fef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l95_c3_8fe9]
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c15_963f]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c25_162a]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c35_e319]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c35_a15d]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l97_c15_8898]
signal MUX_uxn_opcodes_h_l97_c15_8898_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l97_c15_8898_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c15_8898_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c15_8898_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c11_1b0d]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_962d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_962d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fd80( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.pc := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.ram_addr := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff
BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_left,
BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_right,
BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l68_c2_394e
tmp16_MUX_uxn_opcodes_h_l68_c2_394e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l68_c2_394e_cond,
tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iftrue,
tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iffalse,
tmp16_MUX_uxn_opcodes_h_l68_c2_394e_return_output);

-- t8_MUX_uxn_opcodes_h_l68_c2_394e
t8_MUX_uxn_opcodes_h_l68_c2_394e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l68_c2_394e_cond,
t8_MUX_uxn_opcodes_h_l68_c2_394e_iftrue,
t8_MUX_uxn_opcodes_h_l68_c2_394e_iffalse,
t8_MUX_uxn_opcodes_h_l68_c2_394e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l68_c2_394e
result_pc_MUX_uxn_opcodes_h_l68_c2_394e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l68_c2_394e_cond,
result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iftrue,
result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iffalse,
result_pc_MUX_uxn_opcodes_h_l68_c2_394e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_return_output);

-- printf_uxn_opcodes_h_l69_c3_9452_uxn_opcodes_h_l69_c3_9452
printf_uxn_opcodes_h_l69_c3_9452_uxn_opcodes_h_l69_c3_9452 : entity work.printf_uxn_opcodes_h_l69_c3_9452_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l69_c3_9452_uxn_opcodes_h_l69_c3_9452_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3
BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_left,
BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_right,
BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l73_c7_7226
tmp16_MUX_uxn_opcodes_h_l73_c7_7226 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l73_c7_7226_cond,
tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iftrue,
tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iffalse,
tmp16_MUX_uxn_opcodes_h_l73_c7_7226_return_output);

-- t8_MUX_uxn_opcodes_h_l73_c7_7226
t8_MUX_uxn_opcodes_h_l73_c7_7226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l73_c7_7226_cond,
t8_MUX_uxn_opcodes_h_l73_c7_7226_iftrue,
t8_MUX_uxn_opcodes_h_l73_c7_7226_iffalse,
t8_MUX_uxn_opcodes_h_l73_c7_7226_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_return_output);

-- result_pc_MUX_uxn_opcodes_h_l73_c7_7226
result_pc_MUX_uxn_opcodes_h_l73_c7_7226 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l73_c7_7226_cond,
result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iftrue,
result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iffalse,
result_pc_MUX_uxn_opcodes_h_l73_c7_7226_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226
result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_cond,
result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d
BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_08bf
tmp16_MUX_uxn_opcodes_h_l76_c7_08bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_08bf
t8_MUX_uxn_opcodes_h_l76_c7_08bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_08bf_cond,
t8_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_08bf_return_output);

-- result_pc_MUX_uxn_opcodes_h_l76_c7_08bf
result_pc_MUX_uxn_opcodes_h_l76_c7_08bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_cond,
result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue,
result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse,
result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_cond,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e
BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_left,
BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_right,
BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd
tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_cond,
tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue,
tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse,
tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output);

-- result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd
result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_cond,
result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue,
result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse,
result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd
result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e
BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_left,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_right,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l86_c7_d859
tmp16_MUX_uxn_opcodes_h_l86_c7_d859 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l86_c7_d859_cond,
tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iftrue,
tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iffalse,
tmp16_MUX_uxn_opcodes_h_l86_c7_d859_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_return_output);

-- result_pc_MUX_uxn_opcodes_h_l86_c7_d859
result_pc_MUX_uxn_opcodes_h_l86_c7_d859 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l86_c7_d859_cond,
result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iftrue,
result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iffalse,
result_pc_MUX_uxn_opcodes_h_l86_c7_d859_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859
result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_cond,
result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_return_output);

-- CONST_SL_8_uxn_opcodes_h_l88_c3_f40e
CONST_SL_8_uxn_opcodes_h_l88_c3_f40e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_x,
CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5
BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_left,
BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_right,
BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd
BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_left,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_right,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l91_c7_d5be
tmp16_MUX_uxn_opcodes_h_l91_c7_d5be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_cond,
tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue,
tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse,
tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_return_output);

-- result_pc_MUX_uxn_opcodes_h_l91_c7_d5be
result_pc_MUX_uxn_opcodes_h_l91_c7_d5be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_cond,
result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue,
result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse,
result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_cond,
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4
BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_left,
BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_right,
BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6
BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l94_c7_4fef
tmp16_MUX_uxn_opcodes_h_l94_c7_4fef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_cond,
tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue,
tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse,
tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_return_output);

-- result_pc_MUX_uxn_opcodes_h_l94_c7_4fef
result_pc_MUX_uxn_opcodes_h_l94_c7_4fef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_cond,
result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue,
result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse,
result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9
BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_left,
BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_right,
BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f
BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a
BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_return_output);

-- MUX_uxn_opcodes_h_l97_c15_8898
MUX_uxn_opcodes_h_l97_c15_8898 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l97_c15_8898_cond,
MUX_uxn_opcodes_h_l97_c15_8898_iftrue,
MUX_uxn_opcodes_h_l97_c15_8898_iffalse,
MUX_uxn_opcodes_h_l97_c15_8898_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d
BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_return_output,
 tmp16_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
 t8_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
 result_pc_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output,
 tmp16_MUX_uxn_opcodes_h_l73_c7_7226_return_output,
 t8_MUX_uxn_opcodes_h_l73_c7_7226_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_return_output,
 result_pc_MUX_uxn_opcodes_h_l73_c7_7226_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_08bf_return_output,
 result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output,
 tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output,
 result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output,
 tmp16_MUX_uxn_opcodes_h_l86_c7_d859_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_return_output,
 result_pc_MUX_uxn_opcodes_h_l86_c7_d859_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_return_output,
 CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output,
 tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_return_output,
 result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_return_output,
 tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_return_output,
 result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_return_output,
 BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_return_output,
 MUX_uxn_opcodes_h_l97_c15_8898_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_2fe9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l69_c3_9452_uxn_opcodes_h_l69_c3_9452_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_f774 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_7226_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_f934 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l89_c3_db02 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l92_c3_af97 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c15_8898_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c15_8898_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c15_8898_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c15_8898_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l94_l68_DUPLICATE_ee42_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l73_l68_l82_DUPLICATE_a390_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l73_l76_l68_DUPLICATE_129d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l68_DUPLICATE_9e21_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l73_l91_l68_DUPLICATE_8b7a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l94_DUPLICATE_6f85_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l87_l95_DUPLICATE_f10f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd80_uxn_opcodes_h_l63_l104_DUPLICATE_582a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_right := to_unsigned(7, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_f774 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_f774;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_f934 := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_f934;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_2fe9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_2fe9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l73_c11_d2f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l89_c21_18e5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l91_c11_85fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c11_1b0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l86_c11_6e2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l73_l91_l68_DUPLICATE_8b7a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l73_l91_l68_DUPLICATE_8b7a_return_output := result.ram_addr;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l73_c7_7226] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_7226_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_970d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l73_l68_l82_DUPLICATE_a390 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l73_l68_l82_DUPLICATE_a390_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l68_c6_5fff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_left;
     BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output := BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c11_09a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l82_c11_fb8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c25_162a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l92_c21_1cf4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l94_l68_DUPLICATE_ee42 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l94_l68_DUPLICATE_ee42_return_output := result.pc;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l87_l95_DUPLICATE_f10f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l87_l95_DUPLICATE_f10f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l73_l76_l68_DUPLICATE_129d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l73_l76_l68_DUPLICATE_129d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l68_DUPLICATE_9e21 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l68_DUPLICATE_9e21_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c15_963f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l94_DUPLICATE_6f85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l94_DUPLICATE_6f85_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_5fff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_d2f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_970d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_fb8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_6e2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_85fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_09a6_return_output;
     VAR_MUX_uxn_opcodes_h_l97_c15_8898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c15_963f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_1b0d_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l89_c3_db02 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c21_18e5_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l92_c3_af97 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c21_1cf4_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l97_c15_8898_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c25_162a_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l87_l95_DUPLICATE_f10f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l87_l95_DUPLICATE_f10f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l73_l76_l68_DUPLICATE_129d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l73_l76_l68_DUPLICATE_129d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l73_l76_l68_DUPLICATE_129d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l94_l68_DUPLICATE_ee42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l94_l68_DUPLICATE_ee42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l94_l68_DUPLICATE_ee42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l94_l68_DUPLICATE_ee42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l94_l68_DUPLICATE_ee42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l94_l68_DUPLICATE_ee42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l94_l68_DUPLICATE_ee42_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l73_l91_l68_DUPLICATE_8b7a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l73_l91_l68_DUPLICATE_8b7a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l73_l91_l68_DUPLICATE_8b7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l94_DUPLICATE_6f85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l94_DUPLICATE_6f85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l94_DUPLICATE_6f85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l94_DUPLICATE_6f85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l94_DUPLICATE_6f85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l94_DUPLICATE_6f85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l94_DUPLICATE_6f85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l68_DUPLICATE_9e21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l68_DUPLICATE_9e21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l68_DUPLICATE_9e21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l68_DUPLICATE_9e21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l68_DUPLICATE_9e21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l68_DUPLICATE_9e21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l99_l73_l68_DUPLICATE_9e21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l73_l68_l82_DUPLICATE_a390_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l73_l68_l82_DUPLICATE_a390_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l73_l68_l82_DUPLICATE_a390_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_7226_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l89_c3_db02;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l92_c3_af97;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l68_c1_9dfa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l88_c3_f40e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_return_output := CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_962d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l82_c7_8dfd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_962d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l91_c7_d5be] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_return_output := result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l73_c7_7226] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l95_c3_8fe9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_left;
     BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_return_output := BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_08bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;

     -- t8_MUX[uxn_opcodes_h_l76_c7_08bf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_08bf_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_return_output := t8_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_right := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_8fe9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_f40e_return_output;
     VAR_printf_uxn_opcodes_h_l69_c3_9452_uxn_opcodes_h_l69_c3_9452_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_9dfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_962d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_962d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l91_c7_d5be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_7226_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c35_e319] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l68_c2_394e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_4fef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_return_output;

     -- printf_uxn_opcodes_h_l69_c3_9452[uxn_opcodes_h_l69_c3_9452] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l69_c3_9452_uxn_opcodes_h_l69_c3_9452_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l69_c3_9452_uxn_opcodes_h_l69_c3_9452_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l86_c7_d859] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_return_output := result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_4fef] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l73_c7_7226] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l94_c7_4fef] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_cond;
     tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue;
     tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_return_output := tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_08bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;

     -- t8_MUX[uxn_opcodes_h_l73_c7_7226] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l73_c7_7226_cond <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_cond;
     t8_MUX_uxn_opcodes_h_l73_c7_7226_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_iftrue;
     t8_MUX_uxn_opcodes_h_l73_c7_7226_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_return_output := t8_MUX_uxn_opcodes_h_l73_c7_7226_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_e319_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_4fef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_4fef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l86_c7_d859_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l73_c7_7226_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_4fef_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_d5be] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c35_a15d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l73_c7_7226] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l91_c7_d5be] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_cond;
     tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue;
     tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_return_output := tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_return_output;

     -- t8_MUX[uxn_opcodes_h_l68_c2_394e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l68_c2_394e_cond <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_cond;
     t8_MUX_uxn_opcodes_h_l68_c2_394e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_iftrue;
     t8_MUX_uxn_opcodes_h_l68_c2_394e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_return_output := t8_MUX_uxn_opcodes_h_l68_c2_394e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l68_c2_394e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l82_c7_8dfd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_d5be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l97_c15_8898_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c35_a15d_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_d5be_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_d5be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_7226_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l68_c2_394e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_d5be_return_output;
     -- MUX[uxn_opcodes_h_l97_c15_8898] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l97_c15_8898_cond <= VAR_MUX_uxn_opcodes_h_l97_c15_8898_cond;
     MUX_uxn_opcodes_h_l97_c15_8898_iftrue <= VAR_MUX_uxn_opcodes_h_l97_c15_8898_iftrue;
     MUX_uxn_opcodes_h_l97_c15_8898_iffalse <= VAR_MUX_uxn_opcodes_h_l97_c15_8898_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l97_c15_8898_return_output := MUX_uxn_opcodes_h_l97_c15_8898_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_d859] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_08bf] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_return_output := result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_d859] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l68_c2_394e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l86_c7_d859] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l86_c7_d859_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_cond;
     tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iftrue;
     tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_return_output := tmp16_MUX_uxn_opcodes_h_l86_c7_d859_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue := VAR_MUX_uxn_opcodes_h_l97_c15_8898_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_d859_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_d859_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_d859_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l73_c7_7226] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_return_output := result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l82_c7_8dfd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l94_c7_4fef] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_cond;
     result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iftrue;
     result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_return_output := result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l82_c7_8dfd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_cond;
     tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output := tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l82_c7_8dfd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l94_c7_4fef_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l73_c7_7226_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_08bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l76_c7_08bf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_08bf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l91_c7_d5be] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_cond;
     result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iftrue;
     result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_return_output := result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l68_c2_394e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l91_c7_d5be_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l73_c7_7226] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l73_c7_7226] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l73_c7_7226] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l73_c7_7226_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_cond;
     tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iftrue;
     tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_return_output := tmp16_MUX_uxn_opcodes_h_l73_c7_7226_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l86_c7_d859] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l86_c7_d859_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_cond;
     result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iftrue;
     result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_return_output := result_pc_MUX_uxn_opcodes_h_l86_c7_d859_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_7226_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_7226_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l86_c7_d859_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_7226_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l82_c7_8dfd] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_cond;
     result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iftrue;
     result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output := result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l68_c2_394e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l68_c2_394e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l68_c2_394e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l68_c2_394e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_cond;
     tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_return_output := tmp16_MUX_uxn_opcodes_h_l68_c2_394e_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l82_c7_8dfd_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_394e_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l76_c7_08bf] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_cond;
     result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iftrue;
     result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_return_output := result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_08bf_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l73_c7_7226] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l73_c7_7226_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_cond;
     result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iftrue;
     result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_return_output := result_pc_MUX_uxn_opcodes_h_l73_c7_7226_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_7226_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l68_c2_394e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l68_c2_394e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_cond;
     result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_return_output := result_pc_MUX_uxn_opcodes_h_l68_c2_394e_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fd80_uxn_opcodes_h_l63_l104_DUPLICATE_582a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd80_uxn_opcodes_h_l63_l104_DUPLICATE_582a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fd80(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_394e_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_394e_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd80_uxn_opcodes_h_l63_l104_DUPLICATE_582a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd80_uxn_opcodes_h_l63_l104_DUPLICATE_582a_return_output;
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
