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
-- Submodules: 125
entity div2_0CLK_444c40b9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_444c40b9;
architecture arch of div2_0CLK_444c40b9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1344_c6_40c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1344_c1_7c51]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1344_c2_d12c]
signal tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1344_c2_d12c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1344_c2_d12c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1344_c2_d12c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1344_c2_d12c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1344_c2_d12c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1344_c2_d12c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1344_c2_d12c]
signal result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1344_c2_d12c]
signal t16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1344_c2_d12c]
signal n16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1345_c3_f862[uxn_opcodes_h_l1345_c3_f862]
signal printf_uxn_opcodes_h_l1345_c3_f862_uxn_opcodes_h_l1345_c3_f862_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1350_c11_8367]
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1350_c7_f2f9]
signal tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1350_c7_f2f9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1350_c7_f2f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1350_c7_f2f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1350_c7_f2f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1350_c7_f2f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1350_c7_f2f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1350_c7_f2f9]
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1350_c7_f2f9]
signal t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1350_c7_f2f9]
signal n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1353_c11_3a4e]
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1353_c7_f1b4]
signal tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1353_c7_f1b4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c7_f1b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c7_f1b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c7_f1b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1353_c7_f1b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c7_f1b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1353_c7_f1b4]
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1353_c7_f1b4]
signal t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1353_c7_f1b4]
signal n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_61fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1358_c7_672f]
signal tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1358_c7_672f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_672f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_672f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_672f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_672f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_672f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1358_c7_672f]
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1358_c7_672f]
signal t16_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1358_c7_672f]
signal n16_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1361_c11_be7d]
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1361_c7_ef23]
signal tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1361_c7_ef23]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1361_c7_ef23]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1361_c7_ef23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1361_c7_ef23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1361_c7_ef23]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1361_c7_ef23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1361_c7_ef23]
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1361_c7_ef23]
signal t16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1361_c7_ef23]
signal n16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1362_c3_93f9]
signal BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1365_c11_a15f]
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1365_c7_f69e]
signal tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1365_c7_f69e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1365_c7_f69e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1365_c7_f69e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1365_c7_f69e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1365_c7_f69e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1365_c7_f69e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1365_c7_f69e]
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1365_c7_f69e]
signal n16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1368_c11_509d]
signal BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1368_c7_885c]
signal tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1368_c7_885c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1368_c7_885c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1368_c7_885c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1368_c7_885c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1368_c7_885c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1368_c7_885c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1368_c7_885c]
signal result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1368_c7_885c]
signal n16_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_e56e]
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1373_c7_1311]
signal tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1373_c7_1311]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_1311]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_1311]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_1311]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_1311]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_1311]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1373_c7_1311]
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1373_c7_1311]
signal n16_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1376_c11_1d5e]
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1376_c7_2935]
signal tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1376_c7_2935]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c7_2935]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c7_2935]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1376_c7_2935]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c7_2935]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c7_2935]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1376_c7_2935]
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1376_c7_2935]
signal n16_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1377_c3_cd40]
signal BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_a80f]
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l1378_c26_d83b]
signal BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l1378_c11_532e]
signal MUX_uxn_opcodes_h_l1378_c11_532e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1378_c11_532e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l1378_c11_532e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l1378_c11_532e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1381_c32_f1e3]
signal BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1381_c32_4f79]
signal BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1381_c32_3d77]
signal MUX_uxn_opcodes_h_l1381_c32_3d77_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1381_c32_3d77_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1381_c32_3d77_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1381_c32_3d77_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1383_c11_f05c]
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1383_c7_50ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1383_c7_50ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1383_c7_50ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1383_c7_50ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1383_c7_50ed]
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1389_c11_7940]
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1389_c7_6c20]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1389_c7_6c20]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1389_c7_6c20]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1389_c7_6c20]
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1391_c34_aa23]
signal CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1393_c11_4c70]
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c7_e9af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c7_e9af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1
BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c
tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond,
tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c
result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c
result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c
result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c
result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c
result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

-- t16_MUX_uxn_opcodes_h_l1344_c2_d12c
t16_MUX_uxn_opcodes_h_l1344_c2_d12c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond,
t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue,
t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse,
t16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

-- n16_MUX_uxn_opcodes_h_l1344_c2_d12c
n16_MUX_uxn_opcodes_h_l1344_c2_d12c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond,
n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue,
n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse,
n16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

-- printf_uxn_opcodes_h_l1345_c3_f862_uxn_opcodes_h_l1345_c3_f862
printf_uxn_opcodes_h_l1345_c3_f862_uxn_opcodes_h_l1345_c3_f862 : entity work.printf_uxn_opcodes_h_l1345_c3_f862_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1345_c3_f862_uxn_opcodes_h_l1345_c3_f862_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_left,
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_right,
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9
tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond,
tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9
result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output);

-- t16_MUX_uxn_opcodes_h_l1350_c7_f2f9
t16_MUX_uxn_opcodes_h_l1350_c7_f2f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond,
t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue,
t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse,
t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output);

-- n16_MUX_uxn_opcodes_h_l1350_c7_f2f9
n16_MUX_uxn_opcodes_h_l1350_c7_f2f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond,
n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue,
n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse,
n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_left,
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_right,
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4
tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond,
tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4
result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output);

-- t16_MUX_uxn_opcodes_h_l1353_c7_f1b4
t16_MUX_uxn_opcodes_h_l1353_c7_f1b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond,
t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue,
t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse,
t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output);

-- n16_MUX_uxn_opcodes_h_l1353_c7_f1b4
n16_MUX_uxn_opcodes_h_l1353_c7_f1b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond,
n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue,
n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse,
n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1358_c7_672f
tmp16_MUX_uxn_opcodes_h_l1358_c7_672f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_cond,
tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_return_output);

-- t16_MUX_uxn_opcodes_h_l1358_c7_672f
t16_MUX_uxn_opcodes_h_l1358_c7_672f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1358_c7_672f_cond,
t16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue,
t16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse,
t16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output);

-- n16_MUX_uxn_opcodes_h_l1358_c7_672f
n16_MUX_uxn_opcodes_h_l1358_c7_672f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1358_c7_672f_cond,
n16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue,
n16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse,
n16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_left,
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_right,
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23
tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond,
tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue,
tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse,
tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23
result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_cond,
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output);

-- t16_MUX_uxn_opcodes_h_l1361_c7_ef23
t16_MUX_uxn_opcodes_h_l1361_c7_ef23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond,
t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue,
t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse,
t16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output);

-- n16_MUX_uxn_opcodes_h_l1361_c7_ef23
n16_MUX_uxn_opcodes_h_l1361_c7_ef23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond,
n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue,
n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse,
n16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9
BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_left,
BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_right,
BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_left,
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_right,
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e
tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond,
tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e
result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output);

-- n16_MUX_uxn_opcodes_h_l1365_c7_f69e
n16_MUX_uxn_opcodes_h_l1365_c7_f69e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond,
n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue,
n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse,
n16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d
BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_left,
BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_right,
BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1368_c7_885c
tmp16_MUX_uxn_opcodes_h_l1368_c7_885c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_cond,
tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c
result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c
result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c
result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_return_output);

-- n16_MUX_uxn_opcodes_h_l1368_c7_885c
n16_MUX_uxn_opcodes_h_l1368_c7_885c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1368_c7_885c_cond,
n16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue,
n16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse,
n16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_left,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_right,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1373_c7_1311
tmp16_MUX_uxn_opcodes_h_l1373_c7_1311 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_cond,
tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue,
tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse,
tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_cond,
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_return_output);

-- n16_MUX_uxn_opcodes_h_l1373_c7_1311
n16_MUX_uxn_opcodes_h_l1373_c7_1311 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1373_c7_1311_cond,
n16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue,
n16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse,
n16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e
BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_left,
BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_right,
BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1376_c7_2935
tmp16_MUX_uxn_opcodes_h_l1376_c7_2935 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_cond,
tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue,
tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse,
tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935
result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_cond,
result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_return_output);

-- n16_MUX_uxn_opcodes_h_l1376_c7_2935
n16_MUX_uxn_opcodes_h_l1376_c7_2935 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1376_c7_2935_cond,
n16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue,
n16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse,
n16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40
BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_left,
BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_right,
BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_left,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_right,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b
BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_left,
BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_right,
BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_return_output);

-- MUX_uxn_opcodes_h_l1378_c11_532e
MUX_uxn_opcodes_h_l1378_c11_532e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1378_c11_532e_cond,
MUX_uxn_opcodes_h_l1378_c11_532e_iftrue,
MUX_uxn_opcodes_h_l1378_c11_532e_iffalse,
MUX_uxn_opcodes_h_l1378_c11_532e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3
BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_left,
BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_right,
BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79
BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_left,
BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_right,
BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_return_output);

-- MUX_uxn_opcodes_h_l1381_c32_3d77
MUX_uxn_opcodes_h_l1381_c32_3d77 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1381_c32_3d77_cond,
MUX_uxn_opcodes_h_l1381_c32_3d77_iftrue,
MUX_uxn_opcodes_h_l1381_c32_3d77_iffalse,
MUX_uxn_opcodes_h_l1381_c32_3d77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_left,
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_right,
BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed
result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_left,
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_right,
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_cond,
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23
CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_x,
CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_left,
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_right,
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_return_output,
 tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
 t16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
 n16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output,
 tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output,
 t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output,
 n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output,
 t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output,
 n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_return_output,
 t16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output,
 n16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output,
 t16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output,
 n16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output,
 n16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_return_output,
 n16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_return_output,
 n16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_return_output,
 n16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_return_output,
 MUX_uxn_opcodes_h_l1378_c11_532e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_return_output,
 MUX_uxn_opcodes_h_l1381_c32_3d77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output,
 CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_c03d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1345_c3_f862_uxn_opcodes_h_l1345_c3_f862_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_224b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_9069 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1359_c3_b289 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1363_c3_4825 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1366_c3_e308 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_3058 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1374_c3_ff9f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1378_c11_532e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1378_c11_532e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1378_c11_532e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1378_c11_532e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_c274 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1387_c24_cdc8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_ab62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1391_c24_155b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1354_l1362_l1369_l1377_DUPLICATE_0110_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1376_l1389_DUPLICATE_b171_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1340_l1398_DUPLICATE_b2e6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_3058 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_3058;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1363_c3_4825 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1363_c3_4825;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1359_c3_b289 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1359_c3_b289;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1366_c3_e308 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1366_c3_e308;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_c03d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_c03d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_ab62 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_ab62;
     VAR_MUX_uxn_opcodes_h_l1378_c11_532e_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1374_c3_ff9f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1374_c3_ff9f;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_9069 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_9069;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_224b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_224b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_c274 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_c274;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1391_c34_aa23] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_return_output := CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1361_c11_be7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1353_c11_3a4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1383_c11_f05c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1376_l1389_DUPLICATE_b171 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1376_l1389_DUPLICATE_b171_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1393_c11_4c70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_left;
     BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_return_output := BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1389_c11_7940] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_left;
     BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_return_output := BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1365_c11_a15f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1376_c11_1d5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_e56e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1381_c32_f1e3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_left;
     BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_return_output := BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1387_c24_cdc8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1387_c24_cdc8_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1368_c11_509d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1344_c6_40c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_a80f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_61fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1354_l1362_l1369_l1377_DUPLICATE_0110 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1354_l1362_l1369_l1377_DUPLICATE_0110_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1350_c11_8367] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_left;
     BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output := BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1381_c32_f1e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c6_40c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_8367_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3a4e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_61fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_be7d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a15f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1368_c11_509d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_e56e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_1d5e_return_output;
     VAR_MUX_uxn_opcodes_h_l1378_c11_532e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_a80f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1383_c11_f05c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_7940_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_4c70_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1354_l1362_l1369_l1377_DUPLICATE_0110_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1354_l1362_l1369_l1377_DUPLICATE_0110_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1354_l1362_l1369_l1377_DUPLICATE_0110_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1387_c24_cdc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_c193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1383_l1368_l1353_l1389_l1358_l1393_DUPLICATE_4146_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1383_l1368_l1353_l1358_DUPLICATE_5c7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1361_l1365_l1373_l1350_l1376_l1368_l1353_l1358_DUPLICATE_8f6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_l1393_DUPLICATE_ebbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1376_l1389_DUPLICATE_b171_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1376_l1389_DUPLICATE_b171_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1344_l1365_l1373_l1350_l1376_l1368_l1353_l1389_l1358_DUPLICATE_e83a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c7_e9af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1376_c7_2935] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1383_c7_50ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1344_c1_7c51] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1377_c3_cd40] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_left;
     BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_return_output := BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c7_e9af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1362_c3_93f9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_left;
     BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_return_output := BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1391_c24_155b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1391_c24_155b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1391_c34_aa23_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l1381_c32_4f79] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_left;
     BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_return_output := BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1389_c7_6c20] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1381_c32_4f79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1362_c3_93f9_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1377_c3_cd40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1391_c24_155b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1370_l1355_DUPLICATE_b66b_return_output;
     VAR_printf_uxn_opcodes_h_l1345_c3_f862_uxn_opcodes_h_l1345_c3_f862_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1344_c1_7c51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_e9af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output;
     -- t16_MUX[uxn_opcodes_h_l1361_c7_ef23] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond <= VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond;
     t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue;
     t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output := t16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;

     -- MUX[uxn_opcodes_h_l1381_c32_3d77] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1381_c32_3d77_cond <= VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_cond;
     MUX_uxn_opcodes_h_l1381_c32_3d77_iftrue <= VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_iftrue;
     MUX_uxn_opcodes_h_l1381_c32_3d77_iffalse <= VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_return_output := MUX_uxn_opcodes_h_l1381_c32_3d77_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1389_c7_6c20] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output := result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c7_2935] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1373_c7_1311] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1389_c7_6c20] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1383_c7_50ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output;

     -- n16_MUX[uxn_opcodes_h_l1376_c7_2935] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1376_c7_2935_cond <= VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_cond;
     n16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue;
     n16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output := n16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l1378_c26_d83b] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_left;
     BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_return_output := BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_return_output;

     -- printf_uxn_opcodes_h_l1345_c3_f862[uxn_opcodes_h_l1345_c3_f862] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1345_c3_f862_uxn_opcodes_h_l1345_c3_f862_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1345_c3_f862_uxn_opcodes_h_l1345_c3_f862_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1389_c7_6c20] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1378_c11_532e_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l1378_c26_d83b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue := VAR_MUX_uxn_opcodes_h_l1381_c32_3d77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1389_c7_6c20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1368_c7_885c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1383_c7_50ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l1358_c7_672f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1358_c7_672f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_cond;
     t16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue;
     t16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output := t16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;

     -- MUX[uxn_opcodes_h_l1378_c11_532e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1378_c11_532e_cond <= VAR_MUX_uxn_opcodes_h_l1378_c11_532e_cond;
     MUX_uxn_opcodes_h_l1378_c11_532e_iftrue <= VAR_MUX_uxn_opcodes_h_l1378_c11_532e_iftrue;
     MUX_uxn_opcodes_h_l1378_c11_532e_iffalse <= VAR_MUX_uxn_opcodes_h_l1378_c11_532e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1378_c11_532e_return_output := MUX_uxn_opcodes_h_l1378_c11_532e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c7_2935] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1383_c7_50ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_1311] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c7_2935] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;

     -- n16_MUX[uxn_opcodes_h_l1373_c7_1311] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1373_c7_1311_cond <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_cond;
     n16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue;
     n16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output := n16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1383_c7_50ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue := VAR_MUX_uxn_opcodes_h_l1378_c11_532e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1383_c7_50ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1376_c7_2935] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1368_c7_885c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c7_2935] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_1311] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_1311] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;

     -- t16_MUX[uxn_opcodes_h_l1353_c7_f1b4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond;
     t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue;
     t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output := t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1376_c7_2935] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_cond;
     tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output := tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1376_c7_2935] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_return_output := result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;

     -- n16_MUX[uxn_opcodes_h_l1368_c7_885c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1368_c7_885c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_cond;
     n16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue;
     n16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output := n16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1365_c7_f69e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1376_c7_2935_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_1311] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1368_c7_885c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1365_c7_f69e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond;
     n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue;
     n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output := n16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1350_c7_f2f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond;
     t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue;
     t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output := t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_1311] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1368_c7_885c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1365_c7_f69e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1373_c7_1311] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_cond;
     tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output := tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1361_c7_ef23] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1373_c7_1311] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_return_output := result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1373_c7_1311_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1365_c7_f69e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1368_c7_885c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_cond;
     tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output := tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1368_c7_885c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1368_c7_885c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1361_c7_ef23] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;

     -- n16_MUX[uxn_opcodes_h_l1361_c7_ef23] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond <= VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond;
     n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue;
     n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output := n16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;

     -- t16_MUX[uxn_opcodes_h_l1344_c2_d12c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond;
     t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue;
     t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output := t16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1358_c7_672f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1368_c7_885c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1365_c7_f69e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1368_c7_885c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1361_c7_ef23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1365_c7_f69e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1358_c7_672f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1358_c7_672f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_cond;
     n16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue;
     n16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output := n16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1353_c7_f1b4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1361_c7_ef23] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1365_c7_f69e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_672f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1365_c7_f69e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1365_c7_f69e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_cond;
     tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output := tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1365_c7_f69e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1361_c7_ef23] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_cond;
     tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output := tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1353_c7_f1b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1361_c7_ef23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1361_c7_ef23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_672f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1350_c7_f2f9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_672f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1361_c7_ef23] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output := result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;

     -- n16_MUX[uxn_opcodes_h_l1353_c7_f1b4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond;
     n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue;
     n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output := n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1361_c7_ef23_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1350_c7_f2f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c7_f1b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_672f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1344_c2_d12c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1358_c7_672f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_cond;
     tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output := tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_672f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c7_f1b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1358_c7_672f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1350_c7_f2f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond;
     n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue;
     n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output := n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1358_c7_672f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1353_c7_f1b4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond;
     tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output := tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1350_c7_f2f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c7_f1b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1344_c2_d12c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c7_f1b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1350_c7_f2f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1353_c7_f1b4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1344_c2_d12c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond;
     n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue;
     n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output := n16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1353_c7_f1b4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1350_c7_f2f9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond;
     tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output := tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1350_c7_f2f9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1344_c2_d12c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1344_c2_d12c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1350_c7_f2f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1350_c7_f2f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1350_c7_f2f9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1344_c2_d12c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_cond;
     tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output := tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1344_c2_d12c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1344_c2_d12c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1344_c2_d12c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;

     -- Submodule level 13
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1340_l1398_DUPLICATE_b2e6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1340_l1398_DUPLICATE_b2e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c2_d12c_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1340_l1398_DUPLICATE_b2e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1340_l1398_DUPLICATE_b2e6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
