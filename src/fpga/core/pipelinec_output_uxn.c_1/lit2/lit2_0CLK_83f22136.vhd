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
-- Submodules: 102
entity lit2_0CLK_83f22136 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_83f22136;
architecture arch of lit2_0CLK_83f22136 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal lit2_tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_lit2_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l284_c6_3b95]
signal BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l284_c1_fab6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l284_c2_b923]
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_pc_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l284_c2_b923]
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l285_c3_ea79[uxn_opcodes_h_l285_c3_ea79]
signal printf_uxn_opcodes_h_l285_c3_ea79_uxn_opcodes_h_l285_c3_ea79_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l291_c11_7f53]
signal BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l291_c7_f1af]
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l291_c7_f1af]
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l297_c11_526c]
signal BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l297_c7_32d8]
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l297_c7_32d8]
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l297_c7_32d8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l297_c7_32d8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l297_c7_32d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l297_c7_32d8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l297_c7_32d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l297_c7_32d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l297_c7_32d8]
signal result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l297_c7_32d8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l297_c7_32d8]
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l302_c11_8834]
signal BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l302_c7_531d]
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l302_c7_531d]
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l302_c7_531d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l302_c7_531d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l302_c7_531d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l302_c7_531d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l302_c7_531d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l302_c7_531d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l302_c7_531d]
signal result_pc_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l302_c7_531d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l302_c7_531d]
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l304_c3_3ae0]
signal CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l307_c21_c995]
signal BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l309_c11_eb10]
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l309_c7_7d51]
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l309_c7_7d51]
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l309_c7_7d51]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l309_c7_7d51]
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_7d51]
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l309_c7_7d51]
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_7d51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_7d51]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l309_c7_7d51]
signal result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l309_c7_7d51]
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l309_c7_7d51]
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l312_c21_2e21]
signal BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l314_c11_bb5d]
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l314_c7_0e87]
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l314_c7_0e87]
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l314_c7_0e87]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l314_c7_0e87]
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l314_c7_0e87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l314_c7_0e87]
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l314_c7_0e87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l314_c7_0e87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l314_c7_0e87]
signal result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l314_c7_0e87]
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l315_c3_34ab]
signal BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l318_c15_d0f3]
signal BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l320_c11_61ed]
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l320_c7_5bc1]
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l320_c7_5bc1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l320_c7_5bc1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_5bc1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l320_c7_5bc1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_5bc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l320_c7_5bc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l320_c7_5bc1]
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l329_c11_dd67]
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l329_c7_700b]
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l329_c7_700b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_700b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_700b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_700b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l333_c34_29bf]
signal CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95
BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_left,
BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_right,
BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923
result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_pc_MUX_uxn_opcodes_h_l284_c2_b923
result_pc_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_pc_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_cond,
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

-- printf_uxn_opcodes_h_l285_c3_ea79_uxn_opcodes_h_l285_c3_ea79
printf_uxn_opcodes_h_l285_c3_ea79_uxn_opcodes_h_l285_c3_ea79 : entity work.printf_uxn_opcodes_h_l285_c3_ea79_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l285_c3_ea79_uxn_opcodes_h_l285_c3_ea79_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53
BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_left,
BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_right,
BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af
result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_pc_MUX_uxn_opcodes_h_l291_c7_f1af
result_pc_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_cond,
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c
BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_left,
BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_right,
BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8
result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l297_c7_32d8
result_pc_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834
BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_left,
BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_right,
BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d
result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_cond,
result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l302_c7_531d
result_pc_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l302_c7_531d_cond,
result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
result_pc_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0
CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_x,
CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_left,
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_right,
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10
BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_left,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_right,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51
result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- result_pc_MUX_uxn_opcodes_h_l309_c7_7d51
result_pc_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_cond,
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_left,
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_right,
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d
BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_left,
BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_right,
BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87
result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_cond,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_return_output);

-- result_pc_MUX_uxn_opcodes_h_l314_c7_0e87
result_pc_MUX_uxn_opcodes_h_l314_c7_0e87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_cond,
result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue,
result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse,
result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_cond,
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab
BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_left,
BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_right,
BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_left,
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_right,
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed
BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_left,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_right,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1
result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_cond,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67
BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_left,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_right,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b
result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_cond,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l333_c34_29bf
CONST_SR_8_uxn_opcodes_h_l333_c34_29bf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_x,
CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 lit2_tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_pc_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 result_pc_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_return_output,
 CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_return_output,
 result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_return_output,
 BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_return_output,
 CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iffalse : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l287_c3_6b25 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l284_c2_b923_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l285_c3_ea79_uxn_opcodes_h_l285_c3_ea79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l291_c7_f1af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l307_c3_913f : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l312_c3_a237 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l318_c3_acab : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_63e1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l322_c3_750b : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l327_c24_27bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l332_c3_ce08 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_f49f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l333_c24_3cc5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_0e38_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l284_l320_l309_l302_l297_l291_DUPLICATE_b2f6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_e1a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_476f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l284_l320_DUPLICATE_988e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_8de5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_2c4d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l284_l309_DUPLICATE_d8ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l314_l284_l320_DUPLICATE_28ec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l314_l309_l302_l297_l291_l329_DUPLICATE_84e1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l303_l315_DUPLICATE_10a4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l341_l279_DUPLICATE_b331_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_lit2_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_lit2_tmp16 := lit2_tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_right := to_unsigned(4, 3);
     VAR_result_ram_addr_uxn_opcodes_h_l322_c3_750b := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l322_c3_750b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_right := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l287_c3_6b25 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l287_c3_6b25;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l332_c3_ce08 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l332_c3_ce08;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iffalse := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_right := to_unsigned(7, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_63e1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_63e1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_f49f := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iffalse := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_f49f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_left := lit2_tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_x := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse := lit2_tmp16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_left := VAR_phase;
     -- BIN_OP_EQ[uxn_opcodes_h_l320_c11_61ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l284_l320_l309_l302_l297_l291_DUPLICATE_b2f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l284_l320_l309_l302_l297_l291_DUPLICATE_b2f6_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l284_l309_DUPLICATE_d8ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l284_l309_DUPLICATE_d8ab_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_476f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_476f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l284_c6_3b95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_left;
     BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output := BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l303_l315_DUPLICATE_10a4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l303_l315_DUPLICATE_10a4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l291_c7_f1af_return_output := result.is_sp_shift;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l284_c2_b923_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l284_l320_DUPLICATE_988e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l284_l320_DUPLICATE_988e_return_output := result.is_ram_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l318_c15_d0f3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l297_c11_526c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_left;
     BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output := BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l291_c11_7f53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_left;
     BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output := BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l327_c24_27bb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l327_c24_27bb_return_output := CAST_TO_uint8_t_uint16_t(
     lit2_tmp16);

     -- CONST_SR_8[uxn_opcodes_h_l333_c34_29bf] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_x <= VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_return_output := CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l284_c2_b923_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l307_c21_c995] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_left;
     BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_return_output := BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l309_c11_eb10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_left;
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output := BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l314_l309_l302_l297_l291_l329_DUPLICATE_84e1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l314_l309_l302_l297_l291_l329_DUPLICATE_84e1_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l312_c21_2e21] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_left;
     BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_return_output := BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_8de5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_8de5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l302_c11_8834] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_left;
     BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output := BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_2c4d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_2c4d_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_e1a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_e1a5_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_0e38 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_0e38_return_output := result.stack_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l314_l284_l320_DUPLICATE_28ec LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l314_l284_l320_DUPLICATE_28ec_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l329_c11_dd67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_left;
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output := BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l314_c11_bb5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_3b95_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_7f53_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_526c_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8834_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_eb10_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_bb5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_61ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_dd67_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l307_c3_913f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_c995_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l312_c3_a237 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_2e21_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l318_c3_acab := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_d0f3_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l303_l315_DUPLICATE_10a4_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l303_l315_DUPLICATE_10a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l327_c24_27bb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_2c4d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_2c4d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_2c4d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_2c4d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_2c4d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_2c4d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l314_l284_l320_DUPLICATE_28ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l314_l284_l320_DUPLICATE_28ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l314_l284_l320_DUPLICATE_28ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l314_l309_l302_l297_l291_l329_DUPLICATE_84e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l314_l309_l302_l297_l291_l329_DUPLICATE_84e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l314_l309_l302_l297_l291_l329_DUPLICATE_84e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l314_l309_l302_l297_l291_l329_DUPLICATE_84e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l314_l309_l302_l297_l291_l329_DUPLICATE_84e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l314_l309_l302_l297_l291_l329_DUPLICATE_84e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l314_l309_l302_l297_l291_l329_DUPLICATE_84e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l284_l320_l309_l302_l297_l291_DUPLICATE_b2f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l284_l320_l309_l302_l297_l291_DUPLICATE_b2f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l284_l320_l309_l302_l297_l291_DUPLICATE_b2f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l284_l320_l309_l302_l297_l291_DUPLICATE_b2f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l284_l320_l309_l302_l297_l291_DUPLICATE_b2f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l284_l320_l309_l302_l297_l291_DUPLICATE_b2f6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l284_l320_DUPLICATE_988e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l284_l320_DUPLICATE_988e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l284_l309_DUPLICATE_d8ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l284_l309_DUPLICATE_d8ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_e1a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_e1a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_e1a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_e1a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_e1a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_e1a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_e1a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_476f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_476f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_476f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_476f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_476f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_476f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_8de5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_8de5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_8de5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_8de5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_8de5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_DUPLICATE_8de5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_0e38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_0e38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_0e38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_0e38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_0e38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_0e38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l284_l314_l309_l302_l297_l291_l329_DUPLICATE_0e38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l284_c2_b923_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l284_c2_b923_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue := VAR_result_pc_uxn_opcodes_h_l318_c3_acab;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l307_c3_913f;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l312_c3_a237;
     -- result_ram_addr_MUX[uxn_opcodes_h_l320_c7_5bc1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l320_c7_5bc1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_700b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l304_c3_3ae0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_return_output := CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l284_c1_fab6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_700b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l314_c7_0e87] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_cond;
     result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue;
     result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_return_output := result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_700b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l315_c3_34ab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_left;
     BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_return_output := BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l333_c24_3cc5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l333_c24_3cc5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29bf_return_output);

     -- result_is_ram_read_MUX[uxn_opcodes_h_l320_c7_5bc1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l329_c7_700b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_return_output;

     -- Submodule level 2
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_34ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l333_c24_3cc5_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_3ae0_return_output;
     VAR_printf_uxn_opcodes_h_l285_c3_ea79_uxn_opcodes_h_l285_c3_ea79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_fab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_700b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_700b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_700b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_700b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_5bc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- printf_uxn_opcodes_h_l285_c3_ea79[uxn_opcodes_h_l285_c3_ea79] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l285_c3_ea79_uxn_opcodes_h_l285_c3_ea79_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l285_c3_ea79_uxn_opcodes_h_l285_c3_ea79_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_read_MUX[uxn_opcodes_h_l314_c7_0e87] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l329_c7_700b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_return_output := result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_5bc1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l314_c7_0e87] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_return_output := result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l314_c7_0e87] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l314_c7_0e87] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l320_c7_5bc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l320_c7_5bc1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;

     -- Submodule level 3
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_700b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_return_output := result_pc_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l314_c7_0e87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l314_c7_0e87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l314_c7_0e87] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l314_c7_0e87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l320_c7_5bc1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output := result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;

     -- Submodule level 4
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_5bc1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l314_c7_0e87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_return_output := result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- Submodule level 5
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_0e87_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l309_c7_7d51] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_cond;
     result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_return_output := result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- Submodule level 6
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_7d51_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l302_c7_531d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_return_output := result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_pc_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- Submodule level 7
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_531d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l297_c7_32d8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_return_output := result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- Submodule level 8
     REG_VAR_lit2_tmp16 := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_b923_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_32d8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l291_c7_f1af] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_cond;
     result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_return_output := result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- Submodule level 9
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_f1af_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l284_c2_b923] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_cond;
     result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_return_output := result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l341_l279_DUPLICATE_b331 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l341_l279_DUPLICATE_b331_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2f03(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_b923_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_b923_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l341_l279_DUPLICATE_b331_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2f03_uxn_opcodes_h_l341_l279_DUPLICATE_b331_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_lit2_tmp16 <= REG_VAR_lit2_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     lit2_tmp16 <= REG_COMB_lit2_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
