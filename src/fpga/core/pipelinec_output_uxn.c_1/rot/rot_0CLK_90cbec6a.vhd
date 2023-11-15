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
-- Submodules: 58
entity rot_0CLK_90cbec6a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_90cbec6a;
architecture arch of rot_0CLK_90cbec6a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2497_c6_0c6a]
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2497_c1_9c56]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2497_c2_a468]
signal n8_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2497_c2_a468]
signal t8_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2497_c2_a468]
signal l8_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2497_c2_a468]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c2_a468]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c2_a468]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2497_c2_a468]
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c2_a468]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2497_c2_a468]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2498_c3_a89b[uxn_opcodes_h_l2498_c3_a89b]
signal printf_uxn_opcodes_h_l2498_c3_a89b_uxn_opcodes_h_l2498_c3_a89b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2502_c11_4915]
signal BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2502_c7_1dbf]
signal n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2502_c7_1dbf]
signal t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2502_c7_1dbf]
signal l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2502_c7_1dbf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2502_c7_1dbf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2502_c7_1dbf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2502_c7_1dbf]
signal result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2502_c7_1dbf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2502_c7_1dbf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2505_c11_0aa5]
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2505_c7_3aff]
signal n8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2505_c7_3aff]
signal t8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2505_c7_3aff]
signal l8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c7_3aff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c7_3aff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c7_3aff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2505_c7_3aff]
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c7_3aff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c7_3aff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_71f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2509_c7_e8c1]
signal n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2509_c7_e8c1]
signal l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_e8c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_e8c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_e8c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_e8c1]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_e8c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2509_c7_e8c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2512_c30_314d]
signal sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_2659]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2517_c7_b266]
signal l8_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_b266]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_b266]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_b266]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_b266]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_b266]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2523_c11_c1f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2523_c7_02cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2523_c7_02cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2523_c7_02cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2523_c7_02cb]
signal result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2527_c11_0aad]
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2527_c7_ac1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2527_c7_ac1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_left,
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_right,
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_return_output);

-- n8_MUX_uxn_opcodes_h_l2497_c2_a468
n8_MUX_uxn_opcodes_h_l2497_c2_a468 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2497_c2_a468_cond,
n8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue,
n8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse,
n8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output);

-- t8_MUX_uxn_opcodes_h_l2497_c2_a468
t8_MUX_uxn_opcodes_h_l2497_c2_a468 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2497_c2_a468_cond,
t8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue,
t8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse,
t8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output);

-- l8_MUX_uxn_opcodes_h_l2497_c2_a468
l8_MUX_uxn_opcodes_h_l2497_c2_a468 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2497_c2_a468_cond,
l8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue,
l8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse,
l8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_cond,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output);

-- printf_uxn_opcodes_h_l2498_c3_a89b_uxn_opcodes_h_l2498_c3_a89b
printf_uxn_opcodes_h_l2498_c3_a89b_uxn_opcodes_h_l2498_c3_a89b : entity work.printf_uxn_opcodes_h_l2498_c3_a89b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2498_c3_a89b_uxn_opcodes_h_l2498_c3_a89b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_left,
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_right,
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output);

-- n8_MUX_uxn_opcodes_h_l2502_c7_1dbf
n8_MUX_uxn_opcodes_h_l2502_c7_1dbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond,
n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue,
n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse,
n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output);

-- t8_MUX_uxn_opcodes_h_l2502_c7_1dbf
t8_MUX_uxn_opcodes_h_l2502_c7_1dbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond,
t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue,
t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse,
t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output);

-- l8_MUX_uxn_opcodes_h_l2502_c7_1dbf
l8_MUX_uxn_opcodes_h_l2502_c7_1dbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond,
l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue,
l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse,
l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf
result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf
result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_left,
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_right,
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output);

-- n8_MUX_uxn_opcodes_h_l2505_c7_3aff
n8_MUX_uxn_opcodes_h_l2505_c7_3aff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond,
n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue,
n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse,
n8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output);

-- t8_MUX_uxn_opcodes_h_l2505_c7_3aff
t8_MUX_uxn_opcodes_h_l2505_c7_3aff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond,
t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue,
t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse,
t8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output);

-- l8_MUX_uxn_opcodes_h_l2505_c7_3aff
l8_MUX_uxn_opcodes_h_l2505_c7_3aff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond,
l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue,
l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse,
l8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff
result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output);

-- n8_MUX_uxn_opcodes_h_l2509_c7_e8c1
n8_MUX_uxn_opcodes_h_l2509_c7_e8c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond,
n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue,
n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse,
n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output);

-- l8_MUX_uxn_opcodes_h_l2509_c7_e8c1
l8_MUX_uxn_opcodes_h_l2509_c7_e8c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond,
l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue,
l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse,
l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2512_c30_314d
sp_relative_shift_uxn_opcodes_h_l2512_c30_314d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_ins,
sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_x,
sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_y,
sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output);

-- l8_MUX_uxn_opcodes_h_l2517_c7_b266
l8_MUX_uxn_opcodes_h_l2517_c7_b266 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2517_c7_b266_cond,
l8_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue,
l8_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse,
l8_MUX_uxn_opcodes_h_l2517_c7_b266_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb
result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb
result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_left,
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_right,
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_return_output,
 n8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
 t8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
 l8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output,
 n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output,
 t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output,
 l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output,
 n8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output,
 t8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output,
 l8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output,
 n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output,
 l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output,
 sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output,
 l8_MUX_uxn_opcodes_h_l2517_c7_b266_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_1f86 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2498_c3_a89b_uxn_opcodes_h_l2498_c3_a89b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2503_c3_a184 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_58bb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_c840 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_02b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2524_c3_3d8e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2523_c7_02cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2502_l2497_l2527_l2523_l2517_l2505_DUPLICATE_cc94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2497_l2509_l2502_l2505_DUPLICATE_a18e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2523_l2497_l2502_l2505_DUPLICATE_7edd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2497_l2502_l2517_l2505_DUPLICATE_19ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2502_l2527_l2523_l2517_l2509_l2505_DUPLICATE_7b56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2532_l2493_DUPLICATE_0e22_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_58bb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_58bb;
     VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_c840 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_c840;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_1f86 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_1f86;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2524_c3_3d8e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2524_c3_3d8e;
     VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2503_c3_a184 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2503_c3_a184;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_02b0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_02b0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_ins := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2497_c6_0c6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_71f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2502_l2527_l2523_l2517_l2509_l2505_DUPLICATE_7b56 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2502_l2527_l2523_l2517_l2509_l2505_DUPLICATE_7b56_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2502_l2497_l2527_l2523_l2517_l2505_DUPLICATE_cc94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2502_l2497_l2527_l2523_l2517_l2505_DUPLICATE_cc94_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2523_c7_02cb] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2523_c7_02cb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2523_l2497_l2502_l2505_DUPLICATE_7edd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2523_l2497_l2502_l2505_DUPLICATE_7edd_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2505_c11_0aa5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2502_c11_4915] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_left;
     BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output := BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2497_l2509_l2502_l2505_DUPLICATE_a18e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2497_l2509_l2502_l2505_DUPLICATE_a18e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2497_l2502_l2517_l2505_DUPLICATE_19ed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2497_l2502_l2517_l2505_DUPLICATE_19ed_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2523_c11_c1f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2527_c11_0aad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_2659] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2512_c30_314d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_ins;
     sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_x;
     sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_return_output := sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_0c6a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_4915_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_0aa5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_71f6_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_2659_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_c1f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_0aad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2497_l2509_l2502_l2505_DUPLICATE_a18e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2497_l2509_l2502_l2505_DUPLICATE_a18e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2497_l2509_l2502_l2505_DUPLICATE_a18e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2497_l2509_l2502_l2505_DUPLICATE_a18e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2502_l2527_l2523_l2517_l2509_l2505_DUPLICATE_7b56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2502_l2527_l2523_l2517_l2509_l2505_DUPLICATE_7b56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2502_l2527_l2523_l2517_l2509_l2505_DUPLICATE_7b56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2502_l2527_l2523_l2517_l2509_l2505_DUPLICATE_7b56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2502_l2527_l2523_l2517_l2509_l2505_DUPLICATE_7b56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2502_l2527_l2523_l2517_l2509_l2505_DUPLICATE_7b56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2497_l2502_l2517_l2505_DUPLICATE_19ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2497_l2502_l2517_l2505_DUPLICATE_19ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2497_l2502_l2517_l2505_DUPLICATE_19ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2497_l2502_l2517_l2505_DUPLICATE_19ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2502_l2497_l2527_l2523_l2517_l2505_DUPLICATE_cc94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2502_l2497_l2527_l2523_l2517_l2505_DUPLICATE_cc94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2502_l2497_l2527_l2523_l2517_l2505_DUPLICATE_cc94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2502_l2497_l2527_l2523_l2517_l2505_DUPLICATE_cc94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2502_l2497_l2527_l2523_l2517_l2505_DUPLICATE_cc94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2502_l2497_l2527_l2523_l2517_l2505_DUPLICATE_cc94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2523_l2497_l2502_l2505_DUPLICATE_7edd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2523_l2497_l2502_l2505_DUPLICATE_7edd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2523_l2497_l2502_l2505_DUPLICATE_7edd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2523_l2497_l2502_l2505_DUPLICATE_7edd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2523_c7_02cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2512_c30_314d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2523_c7_02cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_b266] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2527_c7_ac1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2523_c7_02cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_e8c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2497_c1_9c56] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_return_output;

     -- t8_MUX[uxn_opcodes_h_l2505_c7_3aff] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond <= VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond;
     t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue;
     t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output := t8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2527_c7_ac1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2509_c7_e8c1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond;
     n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue;
     n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output := n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;

     -- l8_MUX[uxn_opcodes_h_l2517_c7_b266] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2517_c7_b266_cond <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_cond;
     l8_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue;
     l8_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_return_output := l8_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2498_c3_a89b_uxn_opcodes_h_l2498_c3_a89b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2497_c1_9c56_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c7_ac1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2509_c7_e8c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;

     -- l8_MUX[uxn_opcodes_h_l2509_c7_e8c1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond <= VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond;
     l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue;
     l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output := l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;

     -- t8_MUX[uxn_opcodes_h_l2502_c7_1dbf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond <= VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond;
     t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue;
     t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output := t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;

     -- printf_uxn_opcodes_h_l2498_c3_a89b[uxn_opcodes_h_l2498_c3_a89b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2498_c3_a89b_uxn_opcodes_h_l2498_c3_a89b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2498_c3_a89b_uxn_opcodes_h_l2498_c3_a89b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l2505_c7_3aff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond <= VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond;
     n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue;
     n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output := n8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2523_c7_02cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2523_c7_02cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_b266] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_b266] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c7_3aff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;

     -- Submodule level 3
     VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2523_c7_02cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_e8c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_e8c1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;

     -- l8_MUX[uxn_opcodes_h_l2505_c7_3aff] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond <= VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_cond;
     l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue;
     l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output := l8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;

     -- t8_MUX[uxn_opcodes_h_l2497_c2_a468] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2497_c2_a468_cond <= VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_cond;
     t8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue;
     t8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output := t8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_b266] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_b266] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2502_c7_1dbf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c7_3aff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;

     -- n8_MUX[uxn_opcodes_h_l2502_c7_1dbf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond <= VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond;
     n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue;
     n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output := n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_b266_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_e8c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2497_c2_a468] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2497_c2_a468_cond <= VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_cond;
     n8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue;
     n8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output := n8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;

     -- l8_MUX[uxn_opcodes_h_l2502_c7_1dbf] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond <= VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond;
     l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue;
     l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output := l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2505_c7_3aff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c2_a468] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c7_3aff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_e8c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2502_c7_1dbf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_e8c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2502_c7_1dbf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2502_c7_1dbf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c7_3aff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2497_c2_a468] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c7_3aff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;

     -- l8_MUX[uxn_opcodes_h_l2497_c2_a468] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2497_c2_a468_cond <= VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_cond;
     l8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue;
     l8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output := l8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;

     -- Submodule level 6
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_3aff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2502_c7_1dbf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c2_a468] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2502_c7_1dbf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2497_c2_a468] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_return_output := result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_1dbf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2497_c2_a468] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c2_a468] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2532_l2493_DUPLICATE_0e22 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2532_l2493_DUPLICATE_0e22_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_a468_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c2_a468_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2532_l2493_DUPLICATE_0e22_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2532_l2493_DUPLICATE_0e22_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
