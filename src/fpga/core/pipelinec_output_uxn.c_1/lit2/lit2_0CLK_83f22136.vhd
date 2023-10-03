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
-- BIN_OP_EQ[uxn_opcodes_h_l284_c6_cb43]
signal BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l284_c1_cf3a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l284_c2_8589]
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_pc_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output : signed(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l284_c2_8589]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l285_c3_6c01[uxn_opcodes_h_l285_c3_6c01]
signal printf_uxn_opcodes_h_l285_c3_6c01_uxn_opcodes_h_l285_c3_6c01_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l291_c11_de66]
signal BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l291_c7_85b3]
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l291_c7_85b3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l297_c11_6d12]
signal BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l297_c7_9584]
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l297_c7_9584]
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l297_c7_9584]
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l297_c7_9584]
signal result_pc_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l297_c7_9584]
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l297_c7_9584]
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l297_c7_9584]
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l297_c7_9584]
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l297_c7_9584]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l297_c7_9584]
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l297_c7_9584]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l302_c11_8481]
signal BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l302_c7_b926]
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l302_c7_b926]
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l302_c7_b926]
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l302_c7_b926]
signal result_pc_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l302_c7_b926]
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l302_c7_b926]
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l302_c7_b926]
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l302_c7_b926]
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l302_c7_b926]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l302_c7_b926]
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l302_c7_b926]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l304_c3_1316]
signal CONST_SL_8_uxn_opcodes_h_l304_c3_1316_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l304_c3_1316_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l307_c21_6bcf]
signal BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l309_c11_f6fc]
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l309_c7_797a]
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_797a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_797a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l309_c7_797a]
signal result_pc_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l309_c7_797a]
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l309_c7_797a]
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l309_c7_797a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l309_c7_797a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_797a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l309_c7_797a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l309_c7_797a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l312_c21_764a]
signal BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l314_c11_1b6e]
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output : unsigned(0 downto 0);

-- lit2_tmp16_MUX[uxn_opcodes_h_l314_c7_cd6a]
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(15 downto 0);
signal lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l314_c7_cd6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l314_c7_cd6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l314_c7_cd6a]
signal result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l314_c7_cd6a]
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l314_c7_cd6a]
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l314_c7_cd6a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l314_c7_cd6a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l314_c7_cd6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l314_c7_cd6a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l315_c3_04f5]
signal BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l318_c15_9ff9]
signal BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l320_c11_5324]
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_91f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_91f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l320_c7_91f2]
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l320_c7_91f2]
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l320_c7_91f2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l320_c7_91f2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l320_c7_91f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l320_c7_91f2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l329_c11_5661]
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_64f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_64f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_64f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l329_c7_64f6]
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l329_c7_64f6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l333_c34_29d3]
signal CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.pc := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_ram_read := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;
      base.is_ram_write := ref_toks_11;
      base.is_sp_shift := ref_toks_12;
      base.is_pc_updated := ref_toks_13;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43
BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_left,
BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_right,
BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_pc_MUX_uxn_opcodes_h_l284_c2_8589
result_pc_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_pc_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589
result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

-- printf_uxn_opcodes_h_l285_c3_6c01_uxn_opcodes_h_l285_c3_6c01
printf_uxn_opcodes_h_l285_c3_6c01_uxn_opcodes_h_l285_c3_6c01 : entity work.printf_uxn_opcodes_h_l285_c3_6c01_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l285_c3_6c01_uxn_opcodes_h_l285_c3_6c01_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66
BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_left,
BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_right,
BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l291_c7_85b3
result_pc_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3
result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12
BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_left,
BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_right,
BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- result_pc_MUX_uxn_opcodes_h_l297_c7_9584
result_pc_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l297_c7_9584_cond,
result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
result_pc_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_cond,
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584
result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_cond,
result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481
BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_left,
BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_right,
BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- result_pc_MUX_uxn_opcodes_h_l302_c7_b926
result_pc_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l302_c7_b926_cond,
result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
result_pc_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_cond,
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926
result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_cond,
result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_return_output);

-- CONST_SL_8_uxn_opcodes_h_l304_c3_1316
CONST_SL_8_uxn_opcodes_h_l304_c3_1316 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l304_c3_1316_x,
CONST_SL_8_uxn_opcodes_h_l304_c3_1316_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_left,
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_right,
BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc
BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_left,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_right,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l309_c7_797a
result_pc_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l309_c7_797a_cond,
result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
result_pc_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a
result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_cond,
result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_left,
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_right,
BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e
BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_left,
BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_right,
BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output);

-- lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_cond,
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue,
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse,
lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a
result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_cond,
result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue,
result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse,
result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a
result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_cond,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5
BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_left,
BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_right,
BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_left,
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_right,
BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324
BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_left,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_right,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2
result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_cond,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661
BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_left,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_right,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6
result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l333_c34_29d3
CONST_SR_8_uxn_opcodes_h_l333_c34_29d3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_x,
CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_pc_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 result_pc_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 result_pc_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_return_output,
 CONST_SL_8_uxn_opcodes_h_l304_c3_1316_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 result_pc_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output,
 lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output,
 result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_return_output,
 CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iffalse : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l287_c3_a5bd : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l284_c2_8589_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l285_c3_6c01_uxn_opcodes_h_l285_c3_6c01_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l291_c7_85b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l307_c3_d7ec : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_1316_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_1316_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l312_c3_3b7a : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output : unsigned(0 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(15 downto 0);
 variable VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l318_c3_eb18 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l322_c3_ad8f : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_3e89 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l327_c24_3408_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l332_c3_77db : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_7bfb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l333_c24_8431_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_afdc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_d2f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_c915_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_993e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_2297_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l320_l284_DUPLICATE_475a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_be12_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l309_l284_DUPLICATE_ccbd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_4dfb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_9d20_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l315_l303_DUPLICATE_3f30_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l279_l341_DUPLICATE_68f0_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_7bfb := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_7bfb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l332_c3_77db := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l332_c3_77db;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l287_c3_a5bd := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l287_c3_a5bd;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue := to_unsigned(0, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l322_c3_ad8f := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l322_c3_ad8f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_3e89 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_3e89;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_left := lit2_tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_x := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := lit2_tmp16;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse := lit2_tmp16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_left := VAR_phase;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l284_c2_8589_return_output := result.is_stack_index_flipped;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l284_c2_8589_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l320_l284_DUPLICATE_475a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l320_l284_DUPLICATE_475a_return_output := result.is_ram_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l312_c21_764a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_c915 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_c915_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_4dfb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_4dfb_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_d2f6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_d2f6_return_output := result.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_2297 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_2297_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l284_c6_cb43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_left;
     BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output := BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l318_c15_9ff9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l329_c11_5661] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_left;
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output := BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_afdc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_afdc_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_be12 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_be12_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l309_l284_DUPLICATE_ccbd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l309_l284_DUPLICATE_ccbd_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l315_l303_DUPLICATE_3f30 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l315_l303_DUPLICATE_3f30_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_SR_8[uxn_opcodes_h_l333_c34_29d3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_return_output := CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l314_c11_1b6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l302_c11_8481] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_left;
     BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output := BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l297_c11_6d12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_left;
     BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output := BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l291_c11_de66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_left;
     BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output := BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l320_c11_5324] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_left;
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output := BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l291_c7_85b3_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l309_c11_f6fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_9d20 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_9d20_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_993e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_993e_return_output := result.is_stack_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l307_c21_6bcf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l327_c24_3408] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l327_c24_3408_return_output := CAST_TO_uint8_t_uint16_t(
     lit2_tmp16);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l284_c6_cb43_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l291_c11_de66_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l297_c11_6d12_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c11_8481_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_f6fc_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_1b6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_5324_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_5661_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l307_c3_d7ec := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l307_c21_6bcf_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l312_c3_3b7a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l312_c21_764a_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l318_c3_eb18 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l318_c15_9ff9_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l315_l303_DUPLICATE_3f30_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_1316_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l315_l303_DUPLICATE_3f30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l327_c24_3408_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_d2f6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_d2f6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_d2f6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_d2f6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_d2f6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_d2f6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_c915_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_c915_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l320_l314_l284_DUPLICATE_c915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_9d20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_9d20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_9d20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_9d20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_9d20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_9d20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l291_l329_l320_l314_l309_l302_l297_DUPLICATE_9d20_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_4dfb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_4dfb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_4dfb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_4dfb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_4dfb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l291_l284_l320_l309_l302_l297_DUPLICATE_4dfb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l320_l284_DUPLICATE_475a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l320_l284_DUPLICATE_475a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l309_l284_DUPLICATE_ccbd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l309_l284_DUPLICATE_ccbd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_993e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_993e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_993e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_993e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_993e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_993e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_993e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_afdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_afdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_afdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_afdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_afdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_afdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_be12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_be12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_be12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_be12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_be12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l291_l284_l314_l309_l302_l297_DUPLICATE_be12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_2297_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_2297_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_2297_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_2297_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_2297_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_2297_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l291_l329_l284_l314_l309_l302_l297_DUPLICATE_2297_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l284_c2_8589_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l284_c2_8589_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue := VAR_result_pc_uxn_opcodes_h_l318_c3_eb18;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l307_c3_d7ec;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l312_c3_3b7a;
     -- CONST_SL_8[uxn_opcodes_h_l304_c3_1316] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l304_c3_1316_x <= VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_1316_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_1316_return_output := CONST_SL_8_uxn_opcodes_h_l304_c3_1316_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_64f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l320_c7_91f2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l315_c3_04f5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_left;
     BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_return_output := BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l333_c24_8431] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l333_c24_8431_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l333_c34_29d3_return_output);

     -- result_pc_MUX[uxn_opcodes_h_l314_c7_cd6a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_cond;
     result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output := result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_64f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l320_c7_91f2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l320_c7_91f2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_64f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l284_c1_cf3a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l329_c7_64f6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_return_output;

     -- Submodule level 2
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l315_c3_04f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l333_c24_8431_return_output;
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l304_c3_1316_return_output;
     VAR_printf_uxn_opcodes_h_l285_c3_6c01_uxn_opcodes_h_l285_c3_6c01_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l284_c1_cf3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_64f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l329_c7_64f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_64f6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_64f6_return_output;
     -- printf_uxn_opcodes_h_l285_c3_6c01[uxn_opcodes_h_l285_c3_6c01] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l285_c3_6c01_uxn_opcodes_h_l285_c3_6c01_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l285_c3_6c01_uxn_opcodes_h_l285_c3_6c01_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l320_c7_91f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l314_c7_cd6a] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_91f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l320_c7_91f2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l314_c7_cd6a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l314_c7_cd6a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l314_c7_cd6a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_91f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l329_c7_64f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_return_output := result_pc_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- Submodule level 3
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l329_c7_64f6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l314_c7_cd6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l314_c7_cd6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l314_c7_cd6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l320_c7_91f2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_return_output := result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l314_c7_cd6a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_return_output := result_pc_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- Submodule level 4
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_91f2_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_return_output := result_pc_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l314_c7_cd6a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output := result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_return_output := result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- Submodule level 5
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_cd6a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_return_output := result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l309_c7_797a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_return_output := result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- Submodule level 6
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l309_c7_797a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l302_c7_b926] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_cond;
     result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_return_output := result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_pc_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- Submodule level 7
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c7_b926_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- lit2_tmp16_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_return_output := lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l297_c7_9584] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_cond;
     result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_return_output := result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_return_output;

     -- Submodule level 8
     REG_VAR_lit2_tmp16 := VAR_lit2_tmp16_MUX_uxn_opcodes_h_l284_c2_8589_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l297_c7_9584_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l291_c7_85b3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_return_output := result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- Submodule level 9
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l291_c7_85b3_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l284_c2_8589] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_cond;
     result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_return_output := result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l279_l341_DUPLICATE_68f0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l279_l341_DUPLICATE_68f0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l284_c2_8589_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l284_c2_8589_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l279_l341_DUPLICATE_68f0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ebc_uxn_opcodes_h_l279_l341_DUPLICATE_68f0_return_output;
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
