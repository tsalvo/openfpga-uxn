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
-- Submodules: 52
entity jci_0CLK_81936ba3 is
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
end jci_0CLK_81936ba3;
architecture arch of jci_0CLK_81936ba3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l66_c6_3c2e]
signal BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l66_c1_c5ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l66_c2_c114]
signal t8_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l66_c2_c114]
signal result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l66_c2_c114]
signal result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l66_c2_c114]
signal result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l66_c2_c114]
signal result_pc_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l66_c2_c114]
signal result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l66_c2_c114]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l66_c2_c114]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l66_c2_c114]
signal result_sp_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l67_c3_fd03[uxn_opcodes_h_l67_c3_fd03]
signal printf_uxn_opcodes_h_l67_c3_fd03_uxn_opcodes_h_l67_c3_fd03_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l70_c26_14de]
signal BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l73_c11_4e93]
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l73_c7_eb2a]
signal t8_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l73_c7_eb2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l73_c7_eb2a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l73_c7_eb2a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l73_c7_eb2a]
signal result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l73_c7_eb2a]
signal result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l73_c7_eb2a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l73_c7_eb2a]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l73_c7_eb2a]
signal result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l76_c26_a323]
signal BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l78_c11_f492]
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l78_c7_5d19]
signal t8_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l78_c7_5d19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l78_c7_5d19]
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l78_c7_5d19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l78_c7_5d19]
signal result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l78_c7_5d19]
signal result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l78_c7_5d19]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l78_c7_5d19]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l78_c7_5d19]
signal result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l84_c11_d117]
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l84_c7_c7d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l84_c7_c7d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l84_c7_c7d9]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l84_c7_c7d9]
signal result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l84_c7_c7d9]
signal result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l86_c15_fec1]
signal BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l88_c11_c2ce]
signal BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l88_c7_9dc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l88_c7_9dc5]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l88_c7_9dc5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l88_c7_9dc5]
signal result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l89_c26_1b41]
signal BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l89_c26_0e42]
signal MUX_uxn_opcodes_h_l89_c26_0e42_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l89_c26_0e42_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l89_c26_0e42_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l89_c26_0e42_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c15_2633]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l90_c25_d407]
signal BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_return_output : unsigned(16 downto 0);

-- MUX[uxn_opcodes_h_l90_c15_89d7]
signal MUX_uxn_opcodes_h_l90_c15_89d7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l90_c15_89d7_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l90_c15_89d7_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l90_c15_89d7_return_output : unsigned(15 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_132e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.pc := ref_toks_4;
      base.stack_address := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_sp_updated := ref_toks_7;
      base.sp := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e
BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_left,
BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_right,
BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_return_output);

-- t8_MUX_uxn_opcodes_h_l66_c2_c114
t8_MUX_uxn_opcodes_h_l66_c2_c114 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l66_c2_c114_cond,
t8_MUX_uxn_opcodes_h_l66_c2_c114_iftrue,
t8_MUX_uxn_opcodes_h_l66_c2_c114_iffalse,
t8_MUX_uxn_opcodes_h_l66_c2_c114_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114
result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114
result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114
result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_return_output);

-- result_pc_MUX_uxn_opcodes_h_l66_c2_c114
result_pc_MUX_uxn_opcodes_h_l66_c2_c114 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l66_c2_c114_cond,
result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iftrue,
result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iffalse,
result_pc_MUX_uxn_opcodes_h_l66_c2_c114_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114
result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_cond,
result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114
result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114
result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output);

-- result_sp_MUX_uxn_opcodes_h_l66_c2_c114
result_sp_MUX_uxn_opcodes_h_l66_c2_c114 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l66_c2_c114_cond,
result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iftrue,
result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iffalse,
result_sp_MUX_uxn_opcodes_h_l66_c2_c114_return_output);

-- printf_uxn_opcodes_h_l67_c3_fd03_uxn_opcodes_h_l67_c3_fd03
printf_uxn_opcodes_h_l67_c3_fd03_uxn_opcodes_h_l67_c3_fd03 : entity work.printf_uxn_opcodes_h_l67_c3_fd03_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l67_c3_fd03_uxn_opcodes_h_l67_c3_fd03_CLOCK_ENABLE);

-- BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de
BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_left,
BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_right,
BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93
BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_left,
BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_right,
BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output);

-- t8_MUX_uxn_opcodes_h_l73_c7_eb2a
t8_MUX_uxn_opcodes_h_l73_c7_eb2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l73_c7_eb2a_cond,
t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue,
t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse,
t8_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a
result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a
result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a
result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_cond,
result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue,
result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse,
result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a
result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_cond,
result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a
result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output);

-- result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a
result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_cond,
result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue,
result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse,
result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323
BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_left,
BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_right,
BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492
BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_left,
BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_right,
BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output);

-- t8_MUX_uxn_opcodes_h_l78_c7_5d19
t8_MUX_uxn_opcodes_h_l78_c7_5d19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l78_c7_5d19_cond,
t8_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue,
t8_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse,
t8_MUX_uxn_opcodes_h_l78_c7_5d19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_return_output);

-- result_pc_MUX_uxn_opcodes_h_l78_c7_5d19
result_pc_MUX_uxn_opcodes_h_l78_c7_5d19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_cond,
result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue,
result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse,
result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19
result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_cond,
result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19
result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output);

-- result_sp_MUX_uxn_opcodes_h_l78_c7_5d19
result_sp_MUX_uxn_opcodes_h_l78_c7_5d19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_cond,
result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue,
result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse,
result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117
BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_left,
BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_right,
BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9
result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output);

-- result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9
result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_cond,
result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue,
result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse,
result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9
result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_cond,
result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue,
result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse,
result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1
BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_left,
BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_right,
BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce
BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_left,
BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_right,
BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5
result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5
result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_cond,
result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue,
result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse,
result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41
BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_left,
BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_right,
BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_return_output);

-- MUX_uxn_opcodes_h_l89_c26_0e42
MUX_uxn_opcodes_h_l89_c26_0e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l89_c26_0e42_cond,
MUX_uxn_opcodes_h_l89_c26_0e42_iftrue,
MUX_uxn_opcodes_h_l89_c26_0e42_iffalse,
MUX_uxn_opcodes_h_l89_c26_0e42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633
BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407
BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_left,
BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_right,
BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_return_output);

-- MUX_uxn_opcodes_h_l90_c15_89d7
MUX_uxn_opcodes_h_l90_c15_89d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l90_c15_89d7_cond,
MUX_uxn_opcodes_h_l90_c15_89d7_iftrue,
MUX_uxn_opcodes_h_l90_c15_89d7_iffalse,
MUX_uxn_opcodes_h_l90_c15_89d7_return_output);



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
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_return_output,
 t8_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
 result_pc_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
 result_sp_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output,
 t8_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output,
 result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output,
 result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output,
 t8_MUX_uxn_opcodes_h_l78_c7_5d19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_return_output,
 result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output,
 result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output,
 result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output,
 result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output,
 result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_return_output,
 MUX_uxn_opcodes_h_l89_c26_0e42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_return_output,
 MUX_uxn_opcodes_h_l90_c15_89d7_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l67_c3_fd03_uxn_opcodes_h_l67_c3_fd03_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_uxn_opcodes_h_l82_c3_523c : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l78_c7_5d19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l89_c26_0e42_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l89_c26_0e42_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l89_c26_0e42_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l89_c26_0e42_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l90_c15_89d7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l90_c15_89d7_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l90_c15_89d7_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l90_c15_89d7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l88_l84_l78_l73_l66_DUPLICATE_fbad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_8fe1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l66_l73_l88_l78_DUPLICATE_732a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_2600_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l84_l73_l88_l78_DUPLICATE_fe95_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_132e_uxn_opcodes_h_l98_l63_DUPLICATE_2bc4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_right := to_unsigned(1, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l89_c26_0e42_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_uxn_opcodes_h_l82_c3_523c := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue := VAR_result_stack_address_uxn_opcodes_h_l82_c3_523c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l89_c26_0e42_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_left := VAR_pc;
     VAR_MUX_uxn_opcodes_h_l90_c15_89d7_iffalse := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_left := VAR_sp;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_left := t8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse := t8;
     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l78_c7_5d19_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l88_l84_l78_l73_l66_DUPLICATE_fbad LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l88_l84_l78_l73_l66_DUPLICATE_fbad_return_output := result.pc;

     -- BIN_OP_MINUS[uxn_opcodes_h_l86_c15_fec1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_left;
     BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_return_output := BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c15_2633] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l78_c7_5d19_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l88_c11_c2ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l70_c26_14de] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_left;
     BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_return_output := BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l66_c6_3c2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l84_c11_d117] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_left;
     BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output := BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l89_c26_1b41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_left;
     BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_return_output := BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_2600 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_2600_return_output := result.sp;

     -- BIN_OP_PLUS[uxn_opcodes_h_l90_c25_d407] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_left;
     BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_return_output := BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_8fe1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_8fe1_return_output := result.is_pc_updated;

     -- BIN_OP_MINUS[uxn_opcodes_h_l76_c26_a323] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_left;
     BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_return_output := BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l84_l73_l88_l78_DUPLICATE_fe95 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l84_l73_l88_l78_DUPLICATE_fe95_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l78_c11_f492] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_left;
     BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output := BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l73_c11_4e93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_left;
     BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output := BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l66_l73_l88_l78_DUPLICATE_732a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l66_l73_l88_l78_DUPLICATE_732a_return_output := result.is_sp_updated;

     -- result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l78_c7_5d19_return_output := result.stack_address;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_3c2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4e93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l78_c11_f492_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_d117_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_c2ce_return_output;
     VAR_MUX_uxn_opcodes_h_l89_c26_0e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c26_1b41_return_output;
     VAR_MUX_uxn_opcodes_h_l90_c15_89d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c15_2633_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l70_c26_14de_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l76_c26_a323_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l86_c15_fec1_return_output;
     VAR_MUX_uxn_opcodes_h_l90_c15_89d7_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c25_d407_return_output, 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l88_l84_l78_l73_l66_DUPLICATE_fbad_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l88_l84_l78_l73_l66_DUPLICATE_fbad_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l88_l84_l78_l73_l66_DUPLICATE_fbad_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l88_l84_l78_l73_l66_DUPLICATE_fbad_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l88_l84_l78_l73_l66_DUPLICATE_fbad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l84_l73_l88_l78_DUPLICATE_fe95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l84_l73_l88_l78_DUPLICATE_fe95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l84_l73_l88_l78_DUPLICATE_fe95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l84_l73_l88_l78_DUPLICATE_fe95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_8fe1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_8fe1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_8fe1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_8fe1_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l66_l73_l88_l78_DUPLICATE_732a_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l66_l73_l88_l78_DUPLICATE_732a_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l66_l73_l88_l78_DUPLICATE_732a_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l66_l73_l88_l78_DUPLICATE_732a_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_2600_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_2600_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_2600_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l66_l84_l73_l78_DUPLICATE_2600_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l78_c7_5d19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l78_c7_5d19_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse := VAR_result_stack_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l78_c7_5d19_return_output;
     -- result_stack_address_MUX[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_cond;
     result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_return_output := result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;

     -- MUX[uxn_opcodes_h_l89_c26_0e42] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l89_c26_0e42_cond <= VAR_MUX_uxn_opcodes_h_l89_c26_0e42_cond;
     MUX_uxn_opcodes_h_l89_c26_0e42_iftrue <= VAR_MUX_uxn_opcodes_h_l89_c26_0e42_iftrue;
     MUX_uxn_opcodes_h_l89_c26_0e42_iffalse <= VAR_MUX_uxn_opcodes_h_l89_c26_0e42_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l89_c26_0e42_return_output := MUX_uxn_opcodes_h_l89_c26_0e42_return_output;

     -- t8_MUX[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l78_c7_5d19_cond <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_cond;
     t8_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue;
     t8_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_return_output := t8_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;

     -- MUX[uxn_opcodes_h_l90_c15_89d7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l90_c15_89d7_cond <= VAR_MUX_uxn_opcodes_h_l90_c15_89d7_cond;
     MUX_uxn_opcodes_h_l90_c15_89d7_iftrue <= VAR_MUX_uxn_opcodes_h_l90_c15_89d7_iftrue;
     MUX_uxn_opcodes_h_l90_c15_89d7_iffalse <= VAR_MUX_uxn_opcodes_h_l90_c15_89d7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l90_c15_89d7_return_output := MUX_uxn_opcodes_h_l90_c15_89d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l66_c1_c5ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l84_c7_c7d9] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_cond;
     result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue;
     result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output := result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l88_c7_9dc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l88_c7_9dc5] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output;

     -- Submodule level 2
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue := VAR_MUX_uxn_opcodes_h_l89_c26_0e42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue := VAR_MUX_uxn_opcodes_h_l90_c15_89d7_return_output;
     VAR_printf_uxn_opcodes_h_l67_c3_fd03_uxn_opcodes_h_l67_c3_fd03_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_c5ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;
     -- t8_MUX[uxn_opcodes_h_l73_c7_eb2a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l73_c7_eb2a_cond <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_cond;
     t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue;
     t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output := t8_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l73_c7_eb2a] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_cond;
     result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output := result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_cond;
     result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue;
     result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_return_output := result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l84_c7_c7d9] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l73_c7_eb2a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l88_c7_9dc5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output;

     -- printf_uxn_opcodes_h_l67_c3_fd03[uxn_opcodes_h_l67_c3_fd03] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l67_c3_fd03_uxn_opcodes_h_l67_c3_fd03_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l67_c3_fd03_uxn_opcodes_h_l67_c3_fd03_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l84_c7_c7d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l88_c7_9dc5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_cond;
     result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output := result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l73_c7_eb2a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_9dc5_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_iffalse := VAR_t8_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;
     -- result_is_sp_updated_MUX[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l73_c7_eb2a] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_cond;
     result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue;
     result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output := result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l66_c2_c114] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_cond;
     result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_return_output := result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l66_c2_c114] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l84_c7_c7d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l84_c7_c7d9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_cond;
     result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output := result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output;

     -- t8_MUX[uxn_opcodes_h_l66_c2_c114] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l66_c2_c114_cond <= VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_cond;
     t8_MUX_uxn_opcodes_h_l66_c2_c114_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_iftrue;
     t8_MUX_uxn_opcodes_h_l66_c2_c114_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_return_output := t8_MUX_uxn_opcodes_h_l66_c2_c114_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l66_c2_c114] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_c7d9_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l66_c2_c114_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l66_c2_c114] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l66_c2_c114_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_cond;
     result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iftrue;
     result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_return_output := result_sp_MUX_uxn_opcodes_h_l66_c2_c114_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l73_c7_eb2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l78_c7_5d19] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_cond;
     result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iftrue;
     result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_return_output := result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l73_c7_eb2a] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l78_c7_5d19_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l66_c2_c114] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l66_c2_c114] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l73_c7_eb2a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l73_c7_eb2a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_cond;
     result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output := result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;

     -- Submodule level 6
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l73_c7_eb2a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l66_c2_c114] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l66_c2_c114] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l66_c2_c114_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_cond;
     result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iftrue;
     result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_return_output := result_pc_MUX_uxn_opcodes_h_l66_c2_c114_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_132e_uxn_opcodes_h_l98_l63_DUPLICATE_2bc4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_132e_uxn_opcodes_h_l98_l63_DUPLICATE_2bc4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_132e(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
     VAR_result_stack_address_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l66_c2_c114_return_output,
     VAR_result_sp_MUX_uxn_opcodes_h_l66_c2_c114_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_132e_uxn_opcodes_h_l98_l63_DUPLICATE_2bc4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_132e_uxn_opcodes_h_l98_l63_DUPLICATE_2bc4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
