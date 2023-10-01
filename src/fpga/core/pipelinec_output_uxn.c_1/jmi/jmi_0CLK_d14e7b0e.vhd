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
-- Submodules: 49
entity jmi_0CLK_d14e7b0e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmi_0CLK_d14e7b0e;
architecture arch of jmi_0CLK_d14e7b0e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l133_c6_2a99]
signal BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l133_c1_3af1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l133_c2_3551]
signal tmp16_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c2_3551]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l133_c2_3551]
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l133_c2_3551]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l133_c2_3551]
signal result_pc_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l133_c2_3551]
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l133_c2_3551]
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l134_c3_3d64[uxn_opcodes_h_l134_c3_3d64]
signal printf_uxn_opcodes_h_l134_c3_3d64_uxn_opcodes_h_l134_c3_3d64_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l140_c11_91ad]
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l140_c7_1643]
signal tmp16_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c7_1643]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l140_c7_1643]
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l140_c7_1643]
signal result_pc_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l140_c7_1643]
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l140_c7_1643]
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l144_c11_425f]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c7_b09b]
signal tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c7_b09b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c7_b09b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l144_c7_b09b]
signal result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l144_c7_b09b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l144_c7_b09b]
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l146_c3_2e9f]
signal CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c21_d015]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l150_c11_a019]
signal BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l150_c7_15c6]
signal tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l150_c7_15c6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l150_c7_15c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l150_c7_15c6]
signal result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l150_c7_15c6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l150_c7_15c6]
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l152_c21_40a5]
signal BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l154_c11_8342]
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l154_c7_8ebc]
signal tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_8ebc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_8ebc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l154_c7_8ebc]
signal result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l154_c7_8ebc]
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l154_c7_8ebc]
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l155_c3_26a1]
signal BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_a24e]
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_0041]
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l161_c11_7000]
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_7b2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_7b2a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_697c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.pc := ref_toks_4;
      base.is_ram_read := ref_toks_5;
      base.ram_addr := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99
BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_left,
BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_right,
BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l133_c2_3551
tmp16_MUX_uxn_opcodes_h_l133_c2_3551 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l133_c2_3551_cond,
tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iftrue,
tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iffalse,
tmp16_MUX_uxn_opcodes_h_l133_c2_3551_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_return_output);

-- result_pc_MUX_uxn_opcodes_h_l133_c2_3551
result_pc_MUX_uxn_opcodes_h_l133_c2_3551 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l133_c2_3551_cond,
result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iftrue,
result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iffalse,
result_pc_MUX_uxn_opcodes_h_l133_c2_3551_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_cond,
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_return_output);

-- printf_uxn_opcodes_h_l134_c3_3d64_uxn_opcodes_h_l134_c3_3d64
printf_uxn_opcodes_h_l134_c3_3d64_uxn_opcodes_h_l134_c3_3d64 : entity work.printf_uxn_opcodes_h_l134_c3_3d64_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l134_c3_3d64_uxn_opcodes_h_l134_c3_3d64_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad
BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_left,
BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_right,
BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l140_c7_1643
tmp16_MUX_uxn_opcodes_h_l140_c7_1643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l140_c7_1643_cond,
tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iftrue,
tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iffalse,
tmp16_MUX_uxn_opcodes_h_l140_c7_1643_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_return_output);

-- result_pc_MUX_uxn_opcodes_h_l140_c7_1643
result_pc_MUX_uxn_opcodes_h_l140_c7_1643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l140_c7_1643_cond,
result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iftrue,
result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iffalse,
result_pc_MUX_uxn_opcodes_h_l140_c7_1643_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_cond,
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f
BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c7_b09b
tmp16_MUX_uxn_opcodes_h_l144_c7_b09b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_cond,
tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l144_c7_b09b
result_pc_MUX_uxn_opcodes_h_l144_c7_b09b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_cond,
result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue,
result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse,
result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f
CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_x,
CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019
BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_left,
BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_right,
BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output);

-- tmp16_MUX_uxn_opcodes_h_l150_c7_15c6
tmp16_MUX_uxn_opcodes_h_l150_c7_15c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_cond,
tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l150_c7_15c6
result_pc_MUX_uxn_opcodes_h_l150_c7_15c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_cond,
result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue,
result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse,
result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_left,
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_right,
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342
BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_left,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_right,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output);

-- tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc
tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_cond,
tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue,
tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse,
tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc
result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_cond,
result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue,
result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse,
result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1
BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_left,
BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_right,
BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_left,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_right,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_left,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_right,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000
BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_left,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_right,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_return_output,
 tmp16_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
 result_pc_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output,
 tmp16_MUX_uxn_opcodes_h_l140_c7_1643_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_return_output,
 result_pc_MUX_uxn_opcodes_h_l140_c7_1643_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_return_output,
 result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_return_output,
 CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output,
 tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_return_output,
 result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output,
 tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output,
 result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l134_c3_3d64_uxn_opcodes_h_l134_c3_3d64_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l148_c3_2360 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l152_c3_fa81 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l159_c3_44f3 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l157_c3_034e : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l154_c7_8ebc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l161_l150_l144_l140_DUPLICATE_410c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l154_l150_l144_l140_DUPLICATE_5f3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l154_l150_l144_l140_DUPLICATE_46bc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l145_l155_DUPLICATE_08ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_697c_uxn_opcodes_h_l129_l166_DUPLICATE_5e69_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_right := to_unsigned(1, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l157_c3_034e := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l157_c3_034e;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse := tmp16;
     -- result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l154_c7_8ebc] LATENCY=0
     VAR_result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l154_c7_8ebc_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l154_l150_l144_l140_DUPLICATE_5f3d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l154_l150_l144_l140_DUPLICATE_5f3d_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l154_l150_l144_l140_DUPLICATE_46bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l154_l150_l144_l140_DUPLICATE_46bc_return_output := result.is_opc_done;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l154_c7_8ebc] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l154_c7_8ebc_return_output := result.ram_addr;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l145_l155_DUPLICATE_08ac LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l145_l155_DUPLICATE_08ac_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l133_c6_2a99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_left;
     BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output := BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l140_c11_91ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l154_c11_8342] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_left;
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output := BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c21_d015] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l133_c2_3551] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l133_c2_3551_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l161_c11_7000] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_left;
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_return_output := BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l150_c11_a019] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_left;
     BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output := BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l152_c21_40a5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c11_425f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l161_l150_l144_l140_DUPLICATE_410c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l161_l150_l144_l140_DUPLICATE_410c_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_2a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_91ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_425f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_a019_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_7000_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l148_c3_2360 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_d015_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l152_c3_fa81 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_40a5_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l145_l155_DUPLICATE_08ac_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l145_l155_DUPLICATE_08ac_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l154_l150_l144_l140_DUPLICATE_5f3d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l154_l150_l144_l140_DUPLICATE_5f3d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l154_l150_l144_l140_DUPLICATE_5f3d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l154_l150_l144_l140_DUPLICATE_5f3d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l154_l150_l144_l140_DUPLICATE_5f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l154_l150_l144_l140_DUPLICATE_46bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l154_l150_l144_l140_DUPLICATE_46bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l154_l150_l144_l140_DUPLICATE_46bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l154_l150_l144_l140_DUPLICATE_46bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l154_l150_l144_l140_DUPLICATE_46bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l161_l150_l144_l140_DUPLICATE_410c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l161_l150_l144_l140_DUPLICATE_410c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l161_l150_l144_l140_DUPLICATE_410c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l161_l150_l144_l140_DUPLICATE_410c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l161_l150_l144_l140_DUPLICATE_410c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse := VAR_result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l154_c7_8ebc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l133_c2_3551_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l154_c7_8ebc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l148_c3_2360;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l152_c3_fa81;
     -- BIN_OP_OR[uxn_opcodes_h_l155_c3_26a1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_left;
     BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_return_output := BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l154_c7_8ebc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l146_c3_2e9f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_return_output := CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l154_c7_8ebc] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_7b2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l133_c1_3af1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_7b2a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l133_c2_3551] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_right := VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_26a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_2e9f_return_output;
     VAR_printf_uxn_opcodes_h_l134_c3_3d64_uxn_opcodes_h_l134_c3_3d64_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_3af1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_7b2a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l150_c7_15c6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_8ebc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;

     -- printf_uxn_opcodes_h_l134_c3_3d64[uxn_opcodes_h_l134_c3_3d64] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l134_c3_3d64_uxn_opcodes_h_l134_c3_3d64_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l134_c3_3d64_uxn_opcodes_h_l134_c3_3d64_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_a24e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l150_c7_15c6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l154_c7_8ebc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_cond;
     tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output := tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_8ebc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_a24e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l150_c7_15c6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l144_c7_b09b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l144_c7_b09b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_0041] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_left;
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_return_output := BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l150_c7_15c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_cond;
     tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_return_output := tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l150_c7_15c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l159_c3_44f3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_0041_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue := VAR_result_pc_uxn_opcodes_h_l159_c3_44f3;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l140_c7_1643] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l140_c7_1643] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_return_output := result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l154_c7_8ebc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_cond;
     result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output := result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c7_b09b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c7_b09b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_return_output := tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c7_b09b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1643_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_8ebc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1643_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l140_c7_1643] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l140_c7_1643_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_cond;
     tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iftrue;
     tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_return_output := tmp16_MUX_uxn_opcodes_h_l140_c7_1643_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l150_c7_15c6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_cond;
     result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_return_output := result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l133_c2_3551] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_return_output := result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c7_1643] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l133_c2_3551] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l140_c7_1643] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1643_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1643_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_15c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1643_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l133_c2_3551] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l144_c7_b09b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_cond;
     result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_return_output := result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c2_3551] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l133_c2_3551] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l133_c2_3551_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_cond;
     tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iftrue;
     tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_return_output := tmp16_MUX_uxn_opcodes_h_l133_c2_3551_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_b09b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_3551_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l140_c7_1643] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l140_c7_1643_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_cond;
     result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iftrue;
     result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_return_output := result_pc_MUX_uxn_opcodes_h_l140_c7_1643_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1643_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l133_c2_3551] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l133_c2_3551_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_cond;
     result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iftrue;
     result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_return_output := result_pc_MUX_uxn_opcodes_h_l133_c2_3551_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_697c_uxn_opcodes_h_l129_l166_DUPLICATE_5e69 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_697c_uxn_opcodes_h_l129_l166_DUPLICATE_5e69_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_697c(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_3551_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_3551_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_697c_uxn_opcodes_h_l129_l166_DUPLICATE_5e69_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_697c_uxn_opcodes_h_l129_l166_DUPLICATE_5e69_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
