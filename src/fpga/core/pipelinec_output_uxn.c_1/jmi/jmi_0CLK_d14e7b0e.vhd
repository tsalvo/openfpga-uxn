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
-- BIN_OP_EQ[uxn_opcodes_h_l133_c6_5166]
signal BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l133_c1_f537]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l133_c2_cbf3]
signal tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l133_c2_cbf3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c2_cbf3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l133_c2_cbf3]
signal result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l133_c2_cbf3]
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l133_c2_cbf3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l133_c2_cbf3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l134_c3_5707[uxn_opcodes_h_l134_c3_5707]
signal printf_uxn_opcodes_h_l134_c3_5707_uxn_opcodes_h_l134_c3_5707_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l140_c11_13e7]
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l140_c7_6980]
signal tmp16_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l140_c7_6980]
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l140_c7_6980]
signal result_pc_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l140_c7_6980]
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c7_6980]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l140_c7_6980]
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l144_c11_0e7c]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c7_a9f3]
signal tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c7_a9f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l144_c7_a9f3]
signal result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l144_c7_a9f3]
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c7_a9f3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l144_c7_a9f3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l146_c3_3bae]
signal CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c21_c7e5]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l150_c11_9563]
signal BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l150_c7_0d6d]
signal tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l150_c7_0d6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l150_c7_0d6d]
signal result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l150_c7_0d6d]
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l150_c7_0d6d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l150_c7_0d6d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l152_c21_acd1]
signal BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l154_c11_2364]
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l154_c7_2fe6]
signal tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_2fe6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l154_c7_2fe6]
signal result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l154_c7_2fe6]
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_2fe6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l154_c7_2fe6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l155_c3_336f]
signal BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_1233]
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_b1b4]
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l161_c11_ca3f]
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_bdd5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_bdd5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5eac( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.pc := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_ram_read := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166
BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_left,
BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_right,
BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_return_output);

-- tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3
tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_cond,
tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue,
tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse,
tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3
result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_cond,
result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue,
result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse,
result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output);

-- printf_uxn_opcodes_h_l134_c3_5707_uxn_opcodes_h_l134_c3_5707
printf_uxn_opcodes_h_l134_c3_5707_uxn_opcodes_h_l134_c3_5707 : entity work.printf_uxn_opcodes_h_l134_c3_5707_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l134_c3_5707_uxn_opcodes_h_l134_c3_5707_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7
BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_left,
BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_right,
BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l140_c7_6980
tmp16_MUX_uxn_opcodes_h_l140_c7_6980 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l140_c7_6980_cond,
tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iftrue,
tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iffalse,
tmp16_MUX_uxn_opcodes_h_l140_c7_6980_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_return_output);

-- result_pc_MUX_uxn_opcodes_h_l140_c7_6980
result_pc_MUX_uxn_opcodes_h_l140_c7_6980 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l140_c7_6980_cond,
result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iftrue,
result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iffalse,
result_pc_MUX_uxn_opcodes_h_l140_c7_6980_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_cond,
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c
BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3
tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_cond,
tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3
result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_cond,
result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue,
result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse,
result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l146_c3_3bae
CONST_SL_8_uxn_opcodes_h_l146_c3_3bae : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_x,
CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563
BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_left,
BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_right,
BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output);

-- tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d
tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_cond,
tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue,
tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse,
tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d
result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_cond,
result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue,
result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse,
result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_left,
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_right,
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364
BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_left,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_right,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output);

-- tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6
tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_cond,
tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue,
tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse,
tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6
result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_cond,
result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue,
result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse,
result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l155_c3_336f
BIN_OP_OR_uxn_opcodes_h_l155_c3_336f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_left,
BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_right,
BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_left,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_right,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_left,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_right,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f
BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_left,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_right,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_return_output,
 tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
 result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output,
 tmp16_MUX_uxn_opcodes_h_l140_c7_6980_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_return_output,
 result_pc_MUX_uxn_opcodes_h_l140_c7_6980_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output,
 result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output,
 CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output,
 tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output,
 result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output,
 tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output,
 result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l134_c3_5707_uxn_opcodes_h_l134_c3_5707_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l148_c3_4f27 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l152_c3_d23e : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l159_c3_83cf : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l157_c3_a16a : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l154_c7_2fe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_9547_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_9dbf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_9e72_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l155_l145_DUPLICATE_369c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5eac_uxn_opcodes_h_l166_l129_DUPLICATE_4f7b_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_right := to_unsigned(1, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l157_c3_a16a := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l157_c3_a16a;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c21_c7e5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l155_l145_DUPLICATE_369c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l155_l145_DUPLICATE_369c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l133_c6_5166] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_left;
     BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output := BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_9547 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_9547_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c11_0e7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l161_c11_ca3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l152_c21_acd1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l150_c11_9563] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_left;
     BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output := BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l133_c2_cbf3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l133_c2_cbf3_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_9e72 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_9e72_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l140_c11_13e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_9dbf LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_9dbf_return_output := result.pc;

     -- result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l154_c7_2fe6] LATENCY=0
     VAR_result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l154_c7_2fe6_return_output := result.is_ram_read;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l154_c7_2fe6] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l154_c7_2fe6_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l154_c11_2364] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_left;
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output := BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_5166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_13e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_0e7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9563_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_2364_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_ca3f_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l148_c3_4f27 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_c7e5_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l152_c3_d23e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_acd1_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l155_l145_DUPLICATE_369c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l155_l145_DUPLICATE_369c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_9dbf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_9dbf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_9dbf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_9dbf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_9dbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_9e72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_9e72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_9e72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_9e72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_9e72_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_9547_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_9547_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_9547_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_9547_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_9547_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse := VAR_result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l154_c7_2fe6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l133_c2_cbf3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l154_c7_2fe6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l148_c3_4f27;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l152_c3_d23e;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_bdd5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l146_c3_3bae] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_x <= VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_return_output := CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l133_c1_f537] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l154_c7_2fe6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_bdd5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l154_c7_2fe6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l155_c3_336f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_left;
     BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_return_output := BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l133_c2_cbf3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_right := VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_336f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_3bae_return_output;
     VAR_printf_uxn_opcodes_h_l134_c3_5707_uxn_opcodes_h_l134_c3_5707_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f537_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_bdd5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_2fe6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l150_c7_0d6d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;

     -- printf_uxn_opcodes_h_l134_c3_5707[uxn_opcodes_h_l134_c3_5707] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l134_c3_5707_uxn_opcodes_h_l134_c3_5707_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l134_c3_5707_uxn_opcodes_h_l134_c3_5707_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l154_c7_2fe6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_cond;
     tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output := tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_1233] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_left;
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_return_output := BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l150_c7_0d6d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_2fe6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_1233_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l144_c7_a9f3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l144_c7_a9f3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_b1b4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l150_c7_0d6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l150_c7_0d6d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l150_c7_0d6d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_cond;
     tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output := tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l159_c3_83cf := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_b1b4_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue := VAR_result_pc_uxn_opcodes_h_l159_c3_83cf;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c7_a9f3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c7_a9f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l140_c7_6980] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_return_output := result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l154_c7_2fe6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_cond;
     result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output := result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l140_c7_6980] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c7_a9f3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output := tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_6980_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_2fe6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_6980_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c7_6980] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l140_c7_6980] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l150_c7_0d6d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_cond;
     result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output := result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l133_c2_cbf3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l140_c7_6980] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l140_c7_6980_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_cond;
     tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iftrue;
     tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_return_output := tmp16_MUX_uxn_opcodes_h_l140_c7_6980_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l133_c2_cbf3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_6980_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_6980_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_0d6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_6980_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c2_cbf3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l133_c2_cbf3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l144_c7_a9f3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_cond;
     result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output := result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l133_c2_cbf3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_cond;
     tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output := tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_a9f3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l140_c7_6980] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l140_c7_6980_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_cond;
     result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iftrue;
     result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_return_output := result_pc_MUX_uxn_opcodes_h_l140_c7_6980_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_6980_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l133_c2_cbf3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_cond;
     result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output := result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5eac_uxn_opcodes_h_l166_l129_DUPLICATE_4f7b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5eac_uxn_opcodes_h_l166_l129_DUPLICATE_4f7b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5eac(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_cbf3_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5eac_uxn_opcodes_h_l166_l129_DUPLICATE_4f7b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5eac_uxn_opcodes_h_l166_l129_DUPLICATE_4f7b_return_output;
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
