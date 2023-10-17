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
-- Submodules: 54
entity jcn_0CLK_b288bfb7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_b288bfb7;
architecture arch of jcn_0CLK_b288bfb7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l685_c6_9de5]
signal BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l685_c1_0463]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l685_c2_13d6]
signal n8_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l685_c2_13d6]
signal t8_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l685_c2_13d6]
signal result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l685_c2_13d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l685_c2_13d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l685_c2_13d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l685_c2_13d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l685_c2_13d6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l686_c3_8b2f[uxn_opcodes_h_l686_c3_8b2f]
signal printf_uxn_opcodes_h_l686_c3_8b2f_uxn_opcodes_h_l686_c3_8b2f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l690_c11_b934]
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l690_c7_2b26]
signal n8_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l690_c7_2b26]
signal t8_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l690_c7_2b26]
signal result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l690_c7_2b26]
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l690_c7_2b26]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l690_c7_2b26]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l690_c7_2b26]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l690_c7_2b26]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l693_c11_a2a6]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l693_c7_154b]
signal n8_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l693_c7_154b]
signal t8_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l693_c7_154b]
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_154b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c7_154b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l693_c7_154b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c7_154b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c7_154b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l697_c11_9ed5]
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l697_c7_736b]
signal n8_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l697_c7_736b]
signal result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_736b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_736b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_736b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_736b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l697_c7_736b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l700_c11_fb61]
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l700_c7_de4d]
signal n8_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_de4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_de4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_de4d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l700_c7_de4d]
signal result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_de4d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l703_c30_88a5]
signal sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l705_c22_73c3]
signal BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l705_c37_ac85]
signal BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l705_c22_bc6d]
signal MUX_uxn_opcodes_h_l705_c22_bc6d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l705_c22_bc6d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l705_c22_bc6d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l705_c22_bc6d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l707_c11_7613]
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l707_c7_466c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_466c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_466c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_43dc( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5
BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_left,
BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_right,
BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_return_output);

-- n8_MUX_uxn_opcodes_h_l685_c2_13d6
n8_MUX_uxn_opcodes_h_l685_c2_13d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l685_c2_13d6_cond,
n8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue,
n8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse,
n8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output);

-- t8_MUX_uxn_opcodes_h_l685_c2_13d6
t8_MUX_uxn_opcodes_h_l685_c2_13d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l685_c2_13d6_cond,
t8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue,
t8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse,
t8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6
result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_cond,
result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6
result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_return_output);

-- printf_uxn_opcodes_h_l686_c3_8b2f_uxn_opcodes_h_l686_c3_8b2f
printf_uxn_opcodes_h_l686_c3_8b2f_uxn_opcodes_h_l686_c3_8b2f : entity work.printf_uxn_opcodes_h_l686_c3_8b2f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l686_c3_8b2f_uxn_opcodes_h_l686_c3_8b2f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934
BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_left,
BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_right,
BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output);

-- n8_MUX_uxn_opcodes_h_l690_c7_2b26
n8_MUX_uxn_opcodes_h_l690_c7_2b26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l690_c7_2b26_cond,
n8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue,
n8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse,
n8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output);

-- t8_MUX_uxn_opcodes_h_l690_c7_2b26
t8_MUX_uxn_opcodes_h_l690_c7_2b26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l690_c7_2b26_cond,
t8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue,
t8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse,
t8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26
result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_cond,
result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6
BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output);

-- n8_MUX_uxn_opcodes_h_l693_c7_154b
n8_MUX_uxn_opcodes_h_l693_c7_154b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l693_c7_154b_cond,
n8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue,
n8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse,
n8_MUX_uxn_opcodes_h_l693_c7_154b_return_output);

-- t8_MUX_uxn_opcodes_h_l693_c7_154b
t8_MUX_uxn_opcodes_h_l693_c7_154b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l693_c7_154b_cond,
t8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue,
t8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse,
t8_MUX_uxn_opcodes_h_l693_c7_154b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b
result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_cond,
result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5
BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_left,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_right,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output);

-- n8_MUX_uxn_opcodes_h_l697_c7_736b
n8_MUX_uxn_opcodes_h_l697_c7_736b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l697_c7_736b_cond,
n8_MUX_uxn_opcodes_h_l697_c7_736b_iftrue,
n8_MUX_uxn_opcodes_h_l697_c7_736b_iffalse,
n8_MUX_uxn_opcodes_h_l697_c7_736b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b
result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_cond,
result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61
BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_left,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_right,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output);

-- n8_MUX_uxn_opcodes_h_l700_c7_de4d
n8_MUX_uxn_opcodes_h_l700_c7_de4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l700_c7_de4d_cond,
n8_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue,
n8_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse,
n8_MUX_uxn_opcodes_h_l700_c7_de4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d
result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_cond,
result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l703_c30_88a5
sp_relative_shift_uxn_opcodes_h_l703_c30_88a5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_ins,
sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_x,
sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_y,
sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3
BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_left,
BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_right,
BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85
BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_left,
BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_right,
BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_return_output);

-- MUX_uxn_opcodes_h_l705_c22_bc6d
MUX_uxn_opcodes_h_l705_c22_bc6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l705_c22_bc6d_cond,
MUX_uxn_opcodes_h_l705_c22_bc6d_iftrue,
MUX_uxn_opcodes_h_l705_c22_bc6d_iffalse,
MUX_uxn_opcodes_h_l705_c22_bc6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613
BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_left,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_right,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_return_output,
 n8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
 t8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output,
 n8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output,
 t8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output,
 n8_MUX_uxn_opcodes_h_l693_c7_154b_return_output,
 t8_MUX_uxn_opcodes_h_l693_c7_154b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output,
 n8_MUX_uxn_opcodes_h_l697_c7_736b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output,
 n8_MUX_uxn_opcodes_h_l700_c7_de4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_return_output,
 sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_return_output,
 MUX_uxn_opcodes_h_l705_c22_bc6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_8469 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l686_c3_8b2f_uxn_opcodes_h_l686_c3_8b2f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_47e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_d069 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_dfcc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l697_c7_736b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l705_c42_d29b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_c6bf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_043d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_86a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_374c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l697_l693_l707_l690_DUPLICATE_6c68_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l681_l713_DUPLICATE_3c62_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_dfcc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_dfcc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_d069 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_d069;
     VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_8469 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_8469;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_47e3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_47e3;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l707_c11_7613] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_left;
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_return_output := BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l700_c11_fb61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_left;
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output := BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l690_c11_b934] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_left;
     BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output := BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_043d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_043d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l685_c6_9de5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_left;
     BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output := BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l705_c22_73c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l703_c30_88a5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_ins;
     sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_x;
     sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_return_output := sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_c6bf LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_c6bf_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_86a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_86a8_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l697_l693_l707_l690_DUPLICATE_6c68 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l697_l693_l707_l690_DUPLICATE_6c68_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l697_c11_9ed5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_left;
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output := BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l705_c42_d29b] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l705_c42_d29b_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c11_a2a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l697_c7_736b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l697_c7_736b_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_374c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_374c_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c6_9de5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b934_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_a2a6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_9ed5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_fb61_return_output;
     VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c22_73c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_7613_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l705_c42_d29b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_043d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_043d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_043d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_043d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_043d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_c6bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_c6bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_c6bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_c6bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l700_l697_l693_l690_l685_DUPLICATE_c6bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l697_l693_l707_l690_DUPLICATE_6c68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l697_l693_l707_l690_DUPLICATE_6c68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l697_l693_l707_l690_DUPLICATE_6c68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l697_l693_l707_l690_DUPLICATE_6c68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l697_l693_l707_l690_DUPLICATE_6c68_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_374c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_374c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_374c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_374c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_374c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_86a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_86a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_86a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_86a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l693_l707_l690_l685_DUPLICATE_86a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l697_c7_736b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l703_c30_88a5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_466c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l707_c7_466c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_return_output;

     -- t8_MUX[uxn_opcodes_h_l693_c7_154b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l693_c7_154b_cond <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_cond;
     t8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue;
     t8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_return_output := t8_MUX_uxn_opcodes_h_l693_c7_154b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_de4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;

     -- n8_MUX[uxn_opcodes_h_l700_c7_de4d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l700_c7_de4d_cond <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_cond;
     n8_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue;
     n8_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_return_output := n8_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l705_c37_ac85] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_left;
     BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_return_output := BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_736b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l685_c1_0463] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_466c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l705_c37_ac85_return_output)),16);
     VAR_printf_uxn_opcodes_h_l686_c3_8b2f_uxn_opcodes_h_l686_c3_8b2f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l685_c1_0463_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_466c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_466c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_466c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_736b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse := VAR_t8_MUX_uxn_opcodes_h_l693_c7_154b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_736b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_de4d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;

     -- n8_MUX[uxn_opcodes_h_l697_c7_736b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l697_c7_736b_cond <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_cond;
     n8_MUX_uxn_opcodes_h_l697_c7_736b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_iftrue;
     n8_MUX_uxn_opcodes_h_l697_c7_736b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_return_output := n8_MUX_uxn_opcodes_h_l697_c7_736b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_de4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;

     -- printf_uxn_opcodes_h_l686_c3_8b2f[uxn_opcodes_h_l686_c3_8b2f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l686_c3_8b2f_uxn_opcodes_h_l686_c3_8b2f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l686_c3_8b2f_uxn_opcodes_h_l686_c3_8b2f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l705_c22_bc6d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l705_c22_bc6d_cond <= VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_cond;
     MUX_uxn_opcodes_h_l705_c22_bc6d_iftrue <= VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_iftrue;
     MUX_uxn_opcodes_h_l705_c22_bc6d_iffalse <= VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_return_output := MUX_uxn_opcodes_h_l705_c22_bc6d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_de4d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c7_154b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_return_output;

     -- t8_MUX[uxn_opcodes_h_l690_c7_2b26] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l690_c7_2b26_cond <= VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_cond;
     t8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue;
     t8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output := t8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue := VAR_MUX_uxn_opcodes_h_l705_c22_bc6d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l697_c7_736b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_154b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c7_154b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output;

     -- n8_MUX[uxn_opcodes_h_l693_c7_154b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l693_c7_154b_cond <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_cond;
     n8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_iftrue;
     n8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_return_output := n8_MUX_uxn_opcodes_h_l693_c7_154b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l690_c7_2b26] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l697_c7_736b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_return_output;

     -- t8_MUX[uxn_opcodes_h_l685_c2_13d6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l685_c2_13d6_cond <= VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_cond;
     t8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue;
     t8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output := t8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l700_c7_de4d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_return_output := result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_736b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_736b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse := VAR_n8_MUX_uxn_opcodes_h_l693_c7_154b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_736b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_736b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_736b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l700_c7_de4d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output;
     -- n8_MUX[uxn_opcodes_h_l690_c7_2b26] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l690_c7_2b26_cond <= VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_cond;
     n8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue;
     n8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output := n8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_154b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c7_154b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l697_c7_736b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_return_output := result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l685_c2_13d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l693_c7_154b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l690_c7_2b26] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_154b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_154b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_154b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l697_c7_736b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l690_c7_2b26] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l690_c7_2b26] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l690_c7_2b26] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;

     -- n8_MUX[uxn_opcodes_h_l685_c2_13d6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l685_c2_13d6_cond <= VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_cond;
     n8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue;
     n8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output := n8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l685_c2_13d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l693_c7_154b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_return_output := result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l685_c2_13d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c7_154b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l685_c2_13d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l690_c7_2b26] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_cond;
     result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_return_output := result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l685_c2_13d6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l685_c2_13d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c7_2b26_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l685_c2_13d6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_return_output := result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l681_l713_DUPLICATE_3c62 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l681_l713_DUPLICATE_3c62_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_43dc(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c2_13d6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c2_13d6_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l681_l713_DUPLICATE_3c62_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l681_l713_DUPLICATE_3c62_return_output;
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
