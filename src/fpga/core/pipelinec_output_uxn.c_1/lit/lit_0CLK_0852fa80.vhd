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
-- Submodules: 73
entity lit_0CLK_0852fa80 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_0852fa80;
architecture arch of lit_0CLK_0852fa80 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal lit_tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_lit_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l236_c6_31b1]
signal BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l236_c1_a081]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l236_c2_55a4]
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l236_c2_55a4]
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l237_c3_4e9b[uxn_opcodes_h_l237_c3_4e9b]
signal printf_uxn_opcodes_h_l237_c3_4e9b_uxn_opcodes_h_l237_c3_4e9b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l243_c11_409e]
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l243_c7_97af]
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_pc_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l243_c7_97af]
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l249_c11_0297]
signal BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l249_c7_7d3b]
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l254_c11_18c0]
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output : unsigned(0 downto 0);

-- lit_tmp8_MUX[uxn_opcodes_h_l254_c7_39d8]
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(7 downto 0);
signal lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l254_c7_39d8]
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l254_c7_39d8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l254_c7_39d8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l254_c7_39d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l254_c7_39d8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l254_c7_39d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l254_c7_39d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l254_c7_39d8]
signal result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l254_c7_39d8]
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l257_c15_a88d]
signal BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l260_c11_ac9b]
signal BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l260_c7_4c99]
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l260_c7_4c99]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l260_c7_4c99]
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l260_c7_4c99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l260_c7_4c99]
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l260_c7_4c99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l260_c7_4c99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l260_c7_4c99]
signal result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l260_c7_4c99]
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l266_c11_90b0]
signal BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l266_c7_d494]
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l266_c7_d494]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l266_c7_d494]
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l266_c7_d494]
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l266_c7_d494]
signal result_pc_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l266_c7_d494]
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l266_c7_d494]
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(15 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_2f03( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : signed;
 ref_toks_13 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_ram_read := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.pc := ref_toks_10;
      base.is_ram_write := ref_toks_11;
      base.sp_relative_shift := ref_toks_12;
      base.ram_addr := ref_toks_13;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1
BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_left,
BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_right,
BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4
result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l236_c2_55a4
result_pc_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

-- printf_uxn_opcodes_h_l237_c3_4e9b_uxn_opcodes_h_l237_c3_4e9b
printf_uxn_opcodes_h_l237_c3_4e9b_uxn_opcodes_h_l237_c3_4e9b : entity work.printf_uxn_opcodes_h_l237_c3_4e9b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l237_c3_4e9b_uxn_opcodes_h_l237_c3_4e9b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e
BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_left,
BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_right,
BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_cond,
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af
result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_pc_MUX_uxn_opcodes_h_l243_c7_97af
result_pc_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_pc_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_cond,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297
BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_left,
BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_right,
BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b
result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b
result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0
BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_left,
BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_right,
BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output);

-- lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_cond,
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue,
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse,
lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8
result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_cond,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l254_c7_39d8
result_pc_MUX_uxn_opcodes_h_l254_c7_39d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_cond,
result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue,
result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse,
result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_left,
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_right,
BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b
BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_left,
BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_right,
BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99
result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_cond,
result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_return_output);

-- result_pc_MUX_uxn_opcodes_h_l260_c7_4c99
result_pc_MUX_uxn_opcodes_h_l260_c7_4c99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_cond,
result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue,
result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse,
result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_cond,
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0
BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_left,
BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_right,
BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494
result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_cond,
result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_return_output);

-- result_pc_MUX_uxn_opcodes_h_l266_c7_d494
result_pc_MUX_uxn_opcodes_h_l266_c7_d494 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l266_c7_d494_cond,
result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iftrue,
result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iffalse,
result_pc_MUX_uxn_opcodes_h_l266_c7_d494_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_cond,
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 lit_tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_pc_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output,
 lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_return_output,
 result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_return_output,
 result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_return_output,
 result_pc_MUX_uxn_opcodes_h_l266_c7_d494_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iffalse : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l239_c3_f362 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l236_c2_55a4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l237_c3_4e9b_uxn_opcodes_h_l237_c3_4e9b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_97af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output : unsigned(0 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(7 downto 0);
 variable VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l257_c3_7c5e : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l263_c3_acb8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l271_c3_0fcd : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l272_c3_7b12 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l269_c3_e66e : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_3091_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_9d51_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_aa40_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_008e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l266_l236_l260_DUPLICATE_a319_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_416b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_84ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l236_l249_DUPLICATE_71a0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l266_l236_l254_l260_DUPLICATE_0bed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_3d4b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l276_l231_DUPLICATE_d067_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_lit_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_lit_tmp8 := lit_tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l239_c3_f362 := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l239_c3_f362;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_right := to_unsigned(1, 1);
     VAR_result_pc_uxn_opcodes_h_l272_c3_7b12 := resize(to_unsigned(0, 1), 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iftrue := VAR_result_pc_uxn_opcodes_h_l272_c3_7b12;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_right := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iftrue := to_unsigned(0, 1);
     VAR_result_stack_value_uxn_opcodes_h_l271_c3_0fcd := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iftrue := VAR_result_stack_value_uxn_opcodes_h_l271_c3_0fcd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l263_c3_acb8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l263_c3_acb8;
     VAR_result_ram_addr_uxn_opcodes_h_l269_c3_e66e := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l269_c3_e66e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iftrue := VAR_CLOCK_ENABLE;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := lit_tmp8;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse := lit_tmp8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue := lit_tmp8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_left := VAR_phase;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue := VAR_previous_ram_read;
     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l236_c2_55a4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l254_c11_18c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_97af_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l249_c11_0297] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_left;
     BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output := BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l266_l236_l254_l260_DUPLICATE_0bed LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l266_l236_l254_l260_DUPLICATE_0bed_return_output := result.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_3091 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_3091_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_416b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_416b_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_3d4b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_3d4b_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l236_c2_55a4_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_84ab LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_84ab_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_9d51 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_9d51_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l236_c6_31b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l266_c11_90b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l236_l249_DUPLICATE_71a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l236_l249_DUPLICATE_71a0_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l260_c11_ac9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_aa40 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_aa40_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l266_l236_l260_DUPLICATE_a319 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l266_l236_l260_DUPLICATE_a319_return_output := result.is_ram_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l257_c15_a88d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_008e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_008e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l243_c11_409e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_left;
     BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output := BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l236_c6_31b1_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_409e_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l249_c11_0297_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l254_c11_18c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l260_c11_ac9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l266_c11_90b0_return_output;
     VAR_result_pc_uxn_opcodes_h_l257_c3_7c5e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l257_c15_a88d_return_output, 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_84ab_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_84ab_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_84ab_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_84ab_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_84ab_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l266_l236_l254_l260_DUPLICATE_0bed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l266_l236_l254_l260_DUPLICATE_0bed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l266_l236_l254_l260_DUPLICATE_0bed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l266_l236_l254_l260_DUPLICATE_0bed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_3d4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_3d4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_3d4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_3d4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l266_l260_l254_l249_l243_DUPLICATE_3d4b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_9d51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_9d51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_9d51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_9d51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l266_l260_l249_l243_l236_DUPLICATE_9d51_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l266_l236_l260_DUPLICATE_a319_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l266_l236_l260_DUPLICATE_a319_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l266_l236_l260_DUPLICATE_a319_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l236_l249_DUPLICATE_71a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l236_l249_DUPLICATE_71a0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_aa40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_aa40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_aa40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_aa40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_aa40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_008e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_008e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_008e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_008e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_008e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_416b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_416b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_416b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_416b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l260_l254_l249_l243_l236_DUPLICATE_416b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_3091_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_3091_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_3091_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_3091_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l266_l254_l249_l243_l236_DUPLICATE_3091_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l236_c2_55a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l236_c2_55a4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue := VAR_result_pc_uxn_opcodes_h_l257_c3_7c5e;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l236_c1_a081] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l266_c7_d494] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l266_c7_d494] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l266_c7_d494] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_return_output := result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l266_c7_d494] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l266_c7_d494_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_cond;
     result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iftrue;
     result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_return_output := result_pc_MUX_uxn_opcodes_h_l266_c7_d494_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l260_c7_4c99] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l266_c7_d494] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_cond;
     result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_return_output := result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l266_c7_d494] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l254_c7_39d8] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_return_output := lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l260_c7_4c99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l266_c7_d494] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l237_c3_4e9b_uxn_opcodes_h_l237_c3_4e9b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l236_c1_a081_return_output;
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l266_c7_d494_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l266_c7_d494_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l266_c7_d494_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l266_c7_d494_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l266_c7_d494_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l266_c7_d494_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l266_c7_d494_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l260_c7_4c99] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_cond;
     result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_return_output := result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l260_c7_4c99] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_return_output := result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l254_c7_39d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l260_c7_4c99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;

     -- printf_uxn_opcodes_h_l237_c3_4e9b[uxn_opcodes_h_l237_c3_4e9b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l237_c3_4e9b_uxn_opcodes_h_l237_c3_4e9b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l237_c3_4e9b_uxn_opcodes_h_l237_c3_4e9b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- lit_tmp8_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l260_c7_4c99] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_cond;
     result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue;
     result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_return_output := result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l260_c7_4c99] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l260_c7_4c99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l260_c7_4c99] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l254_c7_39d8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- Submodule level 3
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l260_c7_4c99_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l254_c7_39d8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l254_c7_39d8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l254_c7_39d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_return_output := lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l254_c7_39d8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l254_c7_39d8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_return_output := result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l254_c7_39d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l254_c7_39d8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_cond;
     result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_return_output := result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;

     -- Submodule level 4
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_lit_tmp8_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l254_c7_39d8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- lit_tmp8_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l249_c7_7d3b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;

     -- Submodule level 5
     REG_VAR_lit_tmp8 := VAR_lit_tmp8_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l249_c7_7d3b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_pc_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l243_c7_97af] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_cond;
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_return_output := result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_97af_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l236_c2_55a4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l276_l231_DUPLICATE_d067 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l276_l231_DUPLICATE_d067_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2f03(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l236_c2_55a4_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l236_c2_55a4_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l276_l231_DUPLICATE_d067_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l276_l231_DUPLICATE_d067_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_lit_tmp8 <= REG_VAR_lit_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     lit_tmp8 <= REG_COMB_lit_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
