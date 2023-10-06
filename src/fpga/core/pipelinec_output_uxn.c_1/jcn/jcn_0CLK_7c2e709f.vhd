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
-- Submodules: 65
entity jcn_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_7c2e709f;
architecture arch of jcn_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l742_c6_6acd]
signal BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l742_c1_e6f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l742_c2_63a3]
signal t8_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l742_c2_63a3]
signal n8_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l742_c2_63a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l742_c2_63a3]
signal result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l742_c2_63a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l742_c2_63a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l742_c2_63a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l742_c2_63a3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l742_c2_63a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l743_c3_0689[uxn_opcodes_h_l743_c3_0689]
signal printf_uxn_opcodes_h_l743_c3_0689_uxn_opcodes_h_l743_c3_0689_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l748_c11_4464]
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l748_c7_1a92]
signal t8_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l748_c7_1a92]
signal n8_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l748_c7_1a92]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l748_c7_1a92]
signal result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l748_c7_1a92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l748_c7_1a92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l748_c7_1a92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l748_c7_1a92]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l748_c7_1a92]
signal result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l751_c11_dca1]
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l751_c7_b492]
signal t8_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l751_c7_b492]
signal n8_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l751_c7_b492]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l751_c7_b492]
signal result_pc_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l751_c7_b492]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l751_c7_b492]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l751_c7_b492]
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l751_c7_b492]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l751_c7_b492]
signal result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l755_c11_9771]
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l755_c7_7593]
signal n8_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l755_c7_7593]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l755_c7_7593]
signal result_pc_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l755_c7_7593]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l755_c7_7593]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l755_c7_7593]
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l755_c7_7593]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l755_c7_7593]
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l758_c11_df70]
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l758_c7_8b9d]
signal n8_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_8b9d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l758_c7_8b9d]
signal result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l758_c7_8b9d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_8b9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_8b9d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l758_c7_8b9d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l762_c32_c74a]
signal BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l762_c32_dd54]
signal BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l762_c32_da03]
signal MUX_uxn_opcodes_h_l762_c32_da03_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l762_c32_da03_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l762_c32_da03_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l762_c32_da03_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l764_c11_9bdd]
signal BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l764_c7_1086]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l764_c7_1086]
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l764_c7_1086]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l764_c7_1086]
signal result_pc_MUX_uxn_opcodes_h_l764_c7_1086_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l764_c7_1086_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l767_c15_8b69]
signal BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l767_c30_6093]
signal BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l767_c15_2dee]
signal MUX_uxn_opcodes_h_l767_c15_2dee_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l767_c15_2dee_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l767_c15_2dee_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l767_c15_2dee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l769_c11_8bc8]
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l769_c7_6017]
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l769_c7_6017]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_89b6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.pc := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd
BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_left,
BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_right,
BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_return_output);

-- t8_MUX_uxn_opcodes_h_l742_c2_63a3
t8_MUX_uxn_opcodes_h_l742_c2_63a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l742_c2_63a3_cond,
t8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue,
t8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse,
t8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output);

-- n8_MUX_uxn_opcodes_h_l742_c2_63a3
n8_MUX_uxn_opcodes_h_l742_c2_63a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l742_c2_63a3_cond,
n8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue,
n8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse,
n8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l742_c2_63a3
result_pc_MUX_uxn_opcodes_h_l742_c2_63a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_cond,
result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue,
result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse,
result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3
result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3
result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3
result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_return_output);

-- printf_uxn_opcodes_h_l743_c3_0689_uxn_opcodes_h_l743_c3_0689
printf_uxn_opcodes_h_l743_c3_0689_uxn_opcodes_h_l743_c3_0689 : entity work.printf_uxn_opcodes_h_l743_c3_0689_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l743_c3_0689_uxn_opcodes_h_l743_c3_0689_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464
BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_left,
BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_right,
BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output);

-- t8_MUX_uxn_opcodes_h_l748_c7_1a92
t8_MUX_uxn_opcodes_h_l748_c7_1a92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l748_c7_1a92_cond,
t8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue,
t8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse,
t8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output);

-- n8_MUX_uxn_opcodes_h_l748_c7_1a92
n8_MUX_uxn_opcodes_h_l748_c7_1a92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l748_c7_1a92_cond,
n8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue,
n8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse,
n8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output);

-- result_pc_MUX_uxn_opcodes_h_l748_c7_1a92
result_pc_MUX_uxn_opcodes_h_l748_c7_1a92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_cond,
result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue,
result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse,
result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92
result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1
BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_left,
BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_right,
BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output);

-- t8_MUX_uxn_opcodes_h_l751_c7_b492
t8_MUX_uxn_opcodes_h_l751_c7_b492 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l751_c7_b492_cond,
t8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue,
t8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse,
t8_MUX_uxn_opcodes_h_l751_c7_b492_return_output);

-- n8_MUX_uxn_opcodes_h_l751_c7_b492
n8_MUX_uxn_opcodes_h_l751_c7_b492 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l751_c7_b492_cond,
n8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue,
n8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse,
n8_MUX_uxn_opcodes_h_l751_c7_b492_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output);

-- result_pc_MUX_uxn_opcodes_h_l751_c7_b492
result_pc_MUX_uxn_opcodes_h_l751_c7_b492 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l751_c7_b492_cond,
result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iftrue,
result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iffalse,
result_pc_MUX_uxn_opcodes_h_l751_c7_b492_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492
result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771
BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_left,
BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_right,
BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output);

-- n8_MUX_uxn_opcodes_h_l755_c7_7593
n8_MUX_uxn_opcodes_h_l755_c7_7593 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l755_c7_7593_cond,
n8_MUX_uxn_opcodes_h_l755_c7_7593_iftrue,
n8_MUX_uxn_opcodes_h_l755_c7_7593_iffalse,
n8_MUX_uxn_opcodes_h_l755_c7_7593_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output);

-- result_pc_MUX_uxn_opcodes_h_l755_c7_7593
result_pc_MUX_uxn_opcodes_h_l755_c7_7593 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l755_c7_7593_cond,
result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iftrue,
result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iffalse,
result_pc_MUX_uxn_opcodes_h_l755_c7_7593_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593
result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70
BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_left,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_right,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output);

-- n8_MUX_uxn_opcodes_h_l758_c7_8b9d
n8_MUX_uxn_opcodes_h_l758_c7_8b9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l758_c7_8b9d_cond,
n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue,
n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse,
n8_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d
result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_cond,
result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue,
result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse,
result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d
result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a
BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_left,
BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_right,
BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54
BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_left,
BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_right,
BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_return_output);

-- MUX_uxn_opcodes_h_l762_c32_da03
MUX_uxn_opcodes_h_l762_c32_da03 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l762_c32_da03_cond,
MUX_uxn_opcodes_h_l762_c32_da03_iftrue,
MUX_uxn_opcodes_h_l762_c32_da03_iffalse,
MUX_uxn_opcodes_h_l762_c32_da03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd
BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_left,
BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_right,
BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_return_output);

-- result_pc_MUX_uxn_opcodes_h_l764_c7_1086
result_pc_MUX_uxn_opcodes_h_l764_c7_1086 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l764_c7_1086_cond,
result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iftrue,
result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iffalse,
result_pc_MUX_uxn_opcodes_h_l764_c7_1086_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69
BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_left,
BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_right,
BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093
BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_left,
BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_right,
BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_return_output);

-- MUX_uxn_opcodes_h_l767_c15_2dee
MUX_uxn_opcodes_h_l767_c15_2dee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l767_c15_2dee_cond,
MUX_uxn_opcodes_h_l767_c15_2dee_iftrue,
MUX_uxn_opcodes_h_l767_c15_2dee_iffalse,
MUX_uxn_opcodes_h_l767_c15_2dee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8
BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_left,
BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_right,
BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_return_output,
 t8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
 n8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
 result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output,
 t8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output,
 n8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output,
 result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output,
 t8_MUX_uxn_opcodes_h_l751_c7_b492_return_output,
 n8_MUX_uxn_opcodes_h_l751_c7_b492_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output,
 result_pc_MUX_uxn_opcodes_h_l751_c7_b492_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output,
 n8_MUX_uxn_opcodes_h_l755_c7_7593_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output,
 result_pc_MUX_uxn_opcodes_h_l755_c7_7593_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output,
 n8_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output,
 result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_return_output,
 MUX_uxn_opcodes_h_l762_c32_da03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_return_output,
 result_pc_MUX_uxn_opcodes_h_l764_c7_1086_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_return_output,
 MUX_uxn_opcodes_h_l767_c15_2dee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l745_c3_dec3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l743_c3_0689_uxn_opcodes_h_l743_c3_0689_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l749_c3_a791 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_ce18 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l756_c3_8baf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l755_c7_7593_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l762_c32_da03_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l762_c32_da03_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l762_c32_da03_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l762_c32_da03_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l767_c15_2dee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l767_c15_2dee_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l767_c15_2dee_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l767_c35_d396_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l767_c15_2dee_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_DUPLICATE_26d6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_l758_DUPLICATE_59f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l758_DUPLICATE_353f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l755_l751_l748_l742_l769_l758_DUPLICATE_458a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l755_l751_l748_l769_l764_l758_DUPLICATE_9f1f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l755_l748_l758_l751_DUPLICATE_3419_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l774_l738_DUPLICATE_19ef_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l762_c32_da03_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l749_c3_a791 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l749_c3_a791;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_ce18 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_ce18;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l762_c32_da03_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l756_c3_8baf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l756_c3_8baf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l745_c3_dec3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l745_c3_dec3;

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l767_c15_2dee_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l755_l748_l758_l751_DUPLICATE_3419 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l755_l748_l758_l751_DUPLICATE_3419_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l755_l751_l748_l769_l764_l758_DUPLICATE_9f1f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l755_l751_l748_l769_l764_l758_DUPLICATE_9f1f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l742_c6_6acd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_left;
     BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output := BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l767_c35_d396] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l767_c35_d396_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l764_c11_9bdd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_left;
     BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_return_output := BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_DUPLICATE_26d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_DUPLICATE_26d6_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l755_c7_7593] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l755_c7_7593_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l769_c11_8bc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l755_c11_9771] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_left;
     BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output := BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l762_c32_c74a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_left;
     BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_return_output := BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l751_c11_dca1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_left;
     BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output := BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l755_l751_l748_l742_l769_l758_DUPLICATE_458a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l755_l751_l748_l742_l769_l758_DUPLICATE_458a_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l748_c11_4464] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_left;
     BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output := BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_l758_DUPLICATE_59f0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_l758_DUPLICATE_59f0_return_output := result.pc;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l758_DUPLICATE_353f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l758_DUPLICATE_353f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l758_c11_df70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_left;
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output := BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l767_c15_8b69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_left;
     BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_return_output := BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_left := VAR_BIN_OP_AND_uxn_opcodes_h_l762_c32_c74a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c6_6acd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4464_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_dca1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c11_9771_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_df70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_9bdd_return_output;
     VAR_MUX_uxn_opcodes_h_l767_c15_2dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c15_8b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_8bc8_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l767_c35_d396_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l758_DUPLICATE_353f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l758_DUPLICATE_353f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l758_DUPLICATE_353f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l758_DUPLICATE_353f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l758_DUPLICATE_353f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_l758_DUPLICATE_59f0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_l758_DUPLICATE_59f0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_l758_DUPLICATE_59f0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_l758_DUPLICATE_59f0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_l758_DUPLICATE_59f0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_l758_DUPLICATE_59f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l755_l751_l748_l769_l764_l758_DUPLICATE_9f1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l755_l751_l748_l769_l764_l758_DUPLICATE_9f1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l755_l751_l748_l769_l764_l758_DUPLICATE_9f1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l755_l751_l748_l769_l764_l758_DUPLICATE_9f1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l755_l751_l748_l769_l764_l758_DUPLICATE_9f1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l755_l751_l748_l769_l764_l758_DUPLICATE_9f1f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l755_l751_l748_l742_l769_l758_DUPLICATE_458a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l755_l751_l748_l742_l769_l758_DUPLICATE_458a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l755_l751_l748_l742_l769_l758_DUPLICATE_458a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l755_l751_l748_l742_l769_l758_DUPLICATE_458a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l755_l751_l748_l742_l769_l758_DUPLICATE_458a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l755_l751_l748_l742_l769_l758_DUPLICATE_458a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_DUPLICATE_26d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_DUPLICATE_26d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_DUPLICATE_26d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_DUPLICATE_26d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l755_l751_l748_l742_l764_DUPLICATE_26d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l755_l748_l758_l751_DUPLICATE_3419_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l755_l748_l758_l751_DUPLICATE_3419_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l755_l748_l758_l751_DUPLICATE_3419_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l755_l748_l758_l751_DUPLICATE_3419_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l755_c7_7593_return_output;
     -- n8_MUX[uxn_opcodes_h_l758_c7_8b9d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l758_c7_8b9d_cond <= VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_cond;
     n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue;
     n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output := n8_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l764_c7_1086] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l767_c30_6093] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_left;
     BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_return_output := BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l769_c7_6017] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l769_c7_6017] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l758_c7_8b9d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l742_c1_e6f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l762_c32_dd54] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_left;
     BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_return_output := BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_return_output;

     -- t8_MUX[uxn_opcodes_h_l751_c7_b492] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l751_c7_b492_cond <= VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_cond;
     t8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue;
     t8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_return_output := t8_MUX_uxn_opcodes_h_l751_c7_b492_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l755_c7_7593] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l762_c32_da03_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l762_c32_dd54_return_output;
     VAR_MUX_uxn_opcodes_h_l767_c15_2dee_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l767_c30_6093_return_output)),16);
     VAR_printf_uxn_opcodes_h_l743_c3_0689_uxn_opcodes_h_l743_c3_0689_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l742_c1_e6f9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_iffalse := VAR_n8_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_6017_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_6017_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_1086_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l755_c7_7593_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse := VAR_t8_MUX_uxn_opcodes_h_l751_c7_b492_return_output;
     -- MUX[uxn_opcodes_h_l767_c15_2dee] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l767_c15_2dee_cond <= VAR_MUX_uxn_opcodes_h_l767_c15_2dee_cond;
     MUX_uxn_opcodes_h_l767_c15_2dee_iftrue <= VAR_MUX_uxn_opcodes_h_l767_c15_2dee_iftrue;
     MUX_uxn_opcodes_h_l767_c15_2dee_iffalse <= VAR_MUX_uxn_opcodes_h_l767_c15_2dee_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l767_c15_2dee_return_output := MUX_uxn_opcodes_h_l767_c15_2dee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l751_c7_b492] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_return_output;

     -- MUX[uxn_opcodes_h_l762_c32_da03] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l762_c32_da03_cond <= VAR_MUX_uxn_opcodes_h_l762_c32_da03_cond;
     MUX_uxn_opcodes_h_l762_c32_da03_iftrue <= VAR_MUX_uxn_opcodes_h_l762_c32_da03_iftrue;
     MUX_uxn_opcodes_h_l762_c32_da03_iffalse <= VAR_MUX_uxn_opcodes_h_l762_c32_da03_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l762_c32_da03_return_output := MUX_uxn_opcodes_h_l762_c32_da03_return_output;

     -- printf_uxn_opcodes_h_l743_c3_0689[uxn_opcodes_h_l743_c3_0689] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l743_c3_0689_uxn_opcodes_h_l743_c3_0689_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l743_c3_0689_uxn_opcodes_h_l743_c3_0689_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l764_c7_1086] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_return_output;

     -- n8_MUX[uxn_opcodes_h_l755_c7_7593] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l755_c7_7593_cond <= VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_cond;
     n8_MUX_uxn_opcodes_h_l755_c7_7593_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_iftrue;
     n8_MUX_uxn_opcodes_h_l755_c7_7593_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_return_output := n8_MUX_uxn_opcodes_h_l755_c7_7593_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l764_c7_1086] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_8b9d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;

     -- t8_MUX[uxn_opcodes_h_l748_c7_1a92] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l748_c7_1a92_cond <= VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_cond;
     t8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue;
     t8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output := t8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l755_c7_7593] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue := VAR_MUX_uxn_opcodes_h_l762_c32_da03_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iftrue := VAR_MUX_uxn_opcodes_h_l767_c15_2dee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse := VAR_n8_MUX_uxn_opcodes_h_l755_c7_7593_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_1086_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_1086_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l755_c7_7593_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l751_c7_b492_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l758_c7_8b9d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l748_c7_1a92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;

     -- t8_MUX[uxn_opcodes_h_l742_c2_63a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l742_c2_63a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_cond;
     t8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue;
     t8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output := t8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_8b9d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_8b9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;

     -- n8_MUX[uxn_opcodes_h_l751_c7_b492] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l751_c7_b492_cond <= VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_cond;
     n8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_iftrue;
     n8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_return_output := n8_MUX_uxn_opcodes_h_l751_c7_b492_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l751_c7_b492] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l755_c7_7593] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l764_c7_1086] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l764_c7_1086_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_cond;
     result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iftrue;
     result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_return_output := result_pc_MUX_uxn_opcodes_h_l764_c7_1086_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse := VAR_n8_MUX_uxn_opcodes_h_l751_c7_b492_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l751_c7_b492_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_1086_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;
     -- n8_MUX[uxn_opcodes_h_l748_c7_1a92] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l748_c7_1a92_cond <= VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_cond;
     n8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue;
     n8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output := n8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l751_c7_b492] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l748_c7_1a92] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l755_c7_7593] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l755_c7_7593] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l758_c7_8b9d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_cond;
     result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output := result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l742_c2_63a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l755_c7_7593] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l755_c7_7593_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l755_c7_7593_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l758_c7_8b9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l755_c7_7593_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l748_c7_1a92] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l751_c7_b492] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l751_c7_b492] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l742_c2_63a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l755_c7_7593] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l755_c7_7593_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_cond;
     result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iftrue;
     result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_return_output := result_pc_MUX_uxn_opcodes_h_l755_c7_7593_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l751_c7_b492] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_return_output;

     -- n8_MUX[uxn_opcodes_h_l742_c2_63a3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l742_c2_63a3_cond <= VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_cond;
     n8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue;
     n8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output := n8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_b492_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_b492_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l755_c7_7593_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_b492_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l742_c2_63a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l748_c7_1a92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l748_c7_1a92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l751_c7_b492] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l751_c7_b492_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_cond;
     result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iftrue;
     result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_return_output := result_pc_MUX_uxn_opcodes_h_l751_c7_b492_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l748_c7_1a92] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_b492_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l748_c7_1a92] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_cond;
     result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iftrue;
     result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_return_output := result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l742_c2_63a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l742_c2_63a3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l742_c2_63a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_1a92_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l742_c2_63a3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_cond;
     result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_return_output := result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l774_l738_DUPLICATE_19ef LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l774_l738_DUPLICATE_19ef_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_89b6(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c2_63a3_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c2_63a3_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l774_l738_DUPLICATE_19ef_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l774_l738_DUPLICATE_19ef_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
