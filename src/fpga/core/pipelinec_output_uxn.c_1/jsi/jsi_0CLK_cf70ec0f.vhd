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
-- Submodules: 71
entity jsi_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_cf70ec0f;
architecture arch of jsi_0CLK_cf70ec0f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l146_c6_2763]
signal BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l146_c1_0c4d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l146_c2_dbed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l146_c2_dbed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l146_c2_dbed]
signal result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l146_c2_dbed]
signal result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l146_c2_dbed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l146_c2_dbed]
signal result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l146_c2_dbed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l146_c2_dbed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l146_c2_dbed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l146_c2_dbed]
signal tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l147_c3_7db6[uxn_opcodes_h_l147_c3_7db6]
signal printf_uxn_opcodes_h_l147_c3_7db6_uxn_opcodes_h_l147_c3_7db6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l150_c11_d27d]
signal BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l153_c11_66c6]
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l153_c7_2c42]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l153_c7_2c42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l153_c7_2c42]
signal result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l153_c7_2c42]
signal result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l153_c7_2c42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l153_c7_2c42]
signal result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l153_c7_2c42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l153_c7_2c42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l153_c7_2c42]
signal tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l159_c11_83fb]
signal BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l159_c7_5374]
signal result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l159_c7_5374]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l159_c7_5374]
signal result_pc_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l159_c7_5374]
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l159_c7_5374]
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l159_c7_5374]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l159_c7_5374]
signal result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l159_c7_5374]
signal tmp16_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l161_c34_57e9]
signal CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l164_c11_3b92]
signal BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l164_c7_1847]
signal result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l164_c7_1847]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l164_c7_1847]
signal result_pc_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l164_c7_1847]
signal result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l164_c7_1847]
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l164_c7_1847]
signal tmp16_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l168_c11_4247]
signal BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l168_c7_f9d0]
signal result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l168_c7_f9d0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l168_c7_f9d0]
signal result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l168_c7_f9d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l168_c7_f9d0]
signal tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l170_c3_3c0f]
signal CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l171_c21_f89f]
signal BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l173_c11_8782]
signal BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l173_c7_110c]
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l173_c7_110c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l173_c7_110c]
signal result_pc_MUX_uxn_opcodes_h_l173_c7_110c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l173_c7_110c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l173_c7_110c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l173_c7_110c]
signal tmp16_MUX_uxn_opcodes_h_l173_c7_110c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l173_c7_110c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c21_2069]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l176_c11_40ce]
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_375b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l176_c7_375b]
signal result_pc_MUX_uxn_opcodes_h_l176_c7_375b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_375b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_375b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l176_c7_375b]
signal tmp16_MUX_uxn_opcodes_h_l176_c7_375b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_375b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l177_c3_7511]
signal BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l179_c15_08ef]
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l179_c15_cdd2]
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l181_c11_056f]
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l181_c7_abe1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l181_c7_abe1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_210b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.pc := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763
BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_left,
BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_right,
BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed
result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed
result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_cond,
result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed
result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_cond,
result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed
result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

-- result_pc_MUX_uxn_opcodes_h_l146_c2_dbed
result_pc_MUX_uxn_opcodes_h_l146_c2_dbed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_cond,
result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue,
result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse,
result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed
result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed
result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed
result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l146_c2_dbed
tmp16_MUX_uxn_opcodes_h_l146_c2_dbed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_cond,
tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue,
tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse,
tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

-- printf_uxn_opcodes_h_l147_c3_7db6_uxn_opcodes_h_l147_c3_7db6
printf_uxn_opcodes_h_l147_c3_7db6_uxn_opcodes_h_l147_c3_7db6 : entity work.printf_uxn_opcodes_h_l147_c3_7db6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l147_c3_7db6_uxn_opcodes_h_l147_c3_7db6_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d
BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_left,
BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_right,
BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6
BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_left,
BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_right,
BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42
result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_cond,
result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42
result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_cond,
result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42
result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_return_output);

-- result_pc_MUX_uxn_opcodes_h_l153_c7_2c42
result_pc_MUX_uxn_opcodes_h_l153_c7_2c42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_cond,
result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue,
result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse,
result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_return_output);

-- tmp16_MUX_uxn_opcodes_h_l153_c7_2c42
tmp16_MUX_uxn_opcodes_h_l153_c7_2c42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_cond,
tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue,
tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse,
tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb
BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_left,
BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_right,
BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374
result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_cond,
result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_return_output);

-- result_pc_MUX_uxn_opcodes_h_l159_c7_5374
result_pc_MUX_uxn_opcodes_h_l159_c7_5374 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l159_c7_5374_cond,
result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iftrue,
result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iffalse,
result_pc_MUX_uxn_opcodes_h_l159_c7_5374_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374
result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_cond,
result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_return_output);

-- tmp16_MUX_uxn_opcodes_h_l159_c7_5374
tmp16_MUX_uxn_opcodes_h_l159_c7_5374 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l159_c7_5374_cond,
tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iftrue,
tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iffalse,
tmp16_MUX_uxn_opcodes_h_l159_c7_5374_return_output);

-- CONST_SR_8_uxn_opcodes_h_l161_c34_57e9
CONST_SR_8_uxn_opcodes_h_l161_c34_57e9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_x,
CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92
BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_left,
BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_right,
BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847
result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_cond,
result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_return_output);

-- result_pc_MUX_uxn_opcodes_h_l164_c7_1847
result_pc_MUX_uxn_opcodes_h_l164_c7_1847 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l164_c7_1847_cond,
result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iftrue,
result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iffalse,
result_pc_MUX_uxn_opcodes_h_l164_c7_1847_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847
result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_return_output);

-- tmp16_MUX_uxn_opcodes_h_l164_c7_1847
tmp16_MUX_uxn_opcodes_h_l164_c7_1847 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l164_c7_1847_cond,
tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iftrue,
tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iffalse,
tmp16_MUX_uxn_opcodes_h_l164_c7_1847_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247
BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_left,
BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_right,
BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0
result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0
result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_cond,
result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue,
result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse,
result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0
tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_cond,
tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output);

-- CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f
CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_x,
CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f
BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_left,
BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_right,
BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782
BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_left,
BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_right,
BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c
result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l173_c7_110c
result_pc_MUX_uxn_opcodes_h_l173_c7_110c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l173_c7_110c_cond,
result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iftrue,
result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iffalse,
result_pc_MUX_uxn_opcodes_h_l173_c7_110c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c
result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l173_c7_110c
tmp16_MUX_uxn_opcodes_h_l173_c7_110c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l173_c7_110c_cond,
tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iftrue,
tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iffalse,
tmp16_MUX_uxn_opcodes_h_l173_c7_110c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069
BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce
BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_left,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_right,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l176_c7_375b
result_pc_MUX_uxn_opcodes_h_l176_c7_375b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l176_c7_375b_cond,
result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iftrue,
result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iffalse,
result_pc_MUX_uxn_opcodes_h_l176_c7_375b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l176_c7_375b
tmp16_MUX_uxn_opcodes_h_l176_c7_375b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l176_c7_375b_cond,
tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iftrue,
tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iffalse,
tmp16_MUX_uxn_opcodes_h_l176_c7_375b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l177_c3_7511
BIN_OP_OR_uxn_opcodes_h_l177_c3_7511 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_left,
BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_right,
BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef
BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_left,
BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_right,
BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2
BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_left,
BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_right,
BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f
BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_left,
BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_right,
BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
 result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
 tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_return_output,
 result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_return_output,
 tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_return_output,
 result_pc_MUX_uxn_opcodes_h_l159_c7_5374_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_return_output,
 tmp16_MUX_uxn_opcodes_h_l159_c7_5374_return_output,
 CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_return_output,
 result_pc_MUX_uxn_opcodes_h_l164_c7_1847_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_return_output,
 tmp16_MUX_uxn_opcodes_h_l164_c7_1847_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output,
 result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output,
 tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output,
 CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_return_output,
 result_pc_MUX_uxn_opcodes_h_l173_c7_110c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_return_output,
 tmp16_MUX_uxn_opcodes_h_l173_c7_110c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_return_output,
 result_pc_MUX_uxn_opcodes_h_l176_c7_375b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_return_output,
 tmp16_MUX_uxn_opcodes_h_l176_c7_375b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l149_c3_c98b : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l146_c2_dbed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l150_c3_66f1 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l147_c3_7db6_uxn_opcodes_h_l147_c3_7db6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l156_c3_91cd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l153_c7_2c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l157_c24_b153_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l160_c3_fd88 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l161_c24_4e51_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l171_c3_38e0 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l174_c3_7d82 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l179_c3_7f14 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l168_l159_l153_l146_l181_l173_l164_DUPLICATE_9656_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l159_l146_DUPLICATE_4b65_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l159_l146_DUPLICATE_e0a6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l153_l173_l146_DUPLICATE_12cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l168_l159_l153_l146_l176_l173_l164_DUPLICATE_6dd0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l159_l146_l164_DUPLICATE_1e16_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l168_l159_l153_l181_l176_l173_l164_DUPLICATE_2438_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l169_l177_DUPLICATE_215b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l142_l186_DUPLICATE_a5d3_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l149_c3_c98b := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l149_c3_c98b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l156_c3_91cd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l156_c3_91cd;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l160_c3_fd88 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l160_c3_fd88;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l168_l159_l153_l181_l176_l173_l164_DUPLICATE_2438 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l168_l159_l153_l181_l176_l173_l164_DUPLICATE_2438_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l150_c11_d27d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l146_c2_dbed_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l159_l146_DUPLICATE_4b65 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l159_l146_DUPLICATE_4b65_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l176_c11_40ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l168_l159_l153_l146_l176_l173_l164_DUPLICATE_6dd0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l168_l159_l153_l146_l176_l173_l164_DUPLICATE_6dd0_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l164_c11_3b92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_left;
     BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output := BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l169_l177_DUPLICATE_215b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l169_l177_DUPLICATE_215b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c21_2069] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l159_l146_l164_DUPLICATE_1e16 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l159_l146_l164_DUPLICATE_1e16_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l157_c24_b153] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l157_c24_b153_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l159_c11_83fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l181_c11_056f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_left;
     BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_return_output := BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l159_l146_DUPLICATE_e0a6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l159_l146_DUPLICATE_e0a6_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l146_c6_2763] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_left;
     BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output := BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l168_l159_l153_l146_l181_l173_l164_DUPLICATE_9656 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l168_l159_l153_l146_l181_l173_l164_DUPLICATE_9656_return_output := result.is_pc_updated;

     -- CONST_SR_8[uxn_opcodes_h_l161_c34_57e9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_return_output := CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l173_c11_8782] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_left;
     BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output := BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l153_l173_l146_DUPLICATE_12cc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l153_l173_l146_DUPLICATE_12cc_return_output := result.ram_addr;

     -- BIN_OP_PLUS[uxn_opcodes_h_l171_c21_f89f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l168_c11_4247] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_left;
     BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output := BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l153_c7_2c42] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l153_c7_2c42_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l153_c11_66c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l146_c6_2763_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_66c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_83fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_3b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_4247_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l173_c11_8782_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_40ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l181_c11_056f_return_output;
     VAR_tmp16_uxn_opcodes_h_l150_c3_66f1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l150_c11_d27d_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l171_c3_38e0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l171_c21_f89f_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l174_c3_7d82 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c21_2069_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l169_l177_DUPLICATE_215b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l169_l177_DUPLICATE_215b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l157_c24_b153_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l168_l159_l153_l146_l176_l173_l164_DUPLICATE_6dd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l168_l159_l153_l146_l176_l173_l164_DUPLICATE_6dd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l168_l159_l153_l146_l176_l173_l164_DUPLICATE_6dd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l168_l159_l153_l146_l176_l173_l164_DUPLICATE_6dd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l168_l159_l153_l146_l176_l173_l164_DUPLICATE_6dd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l168_l159_l153_l146_l176_l173_l164_DUPLICATE_6dd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l168_l159_l153_l146_l176_l173_l164_DUPLICATE_6dd0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l153_l173_l146_DUPLICATE_12cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l153_l173_l146_DUPLICATE_12cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l153_l173_l146_DUPLICATE_12cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l168_l159_l153_l181_l176_l173_l164_DUPLICATE_2438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l168_l159_l153_l181_l176_l173_l164_DUPLICATE_2438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l168_l159_l153_l181_l176_l173_l164_DUPLICATE_2438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l168_l159_l153_l181_l176_l173_l164_DUPLICATE_2438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l168_l159_l153_l181_l176_l173_l164_DUPLICATE_2438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l168_l159_l153_l181_l176_l173_l164_DUPLICATE_2438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l168_l159_l153_l181_l176_l173_l164_DUPLICATE_2438_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l168_l159_l153_l146_l181_l173_l164_DUPLICATE_9656_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l168_l159_l153_l146_l181_l173_l164_DUPLICATE_9656_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l168_l159_l153_l146_l181_l173_l164_DUPLICATE_9656_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l168_l159_l153_l146_l181_l173_l164_DUPLICATE_9656_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l168_l159_l153_l146_l181_l173_l164_DUPLICATE_9656_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l168_l159_l153_l146_l181_l173_l164_DUPLICATE_9656_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l168_l159_l153_l146_l181_l173_l164_DUPLICATE_9656_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l159_l146_l164_DUPLICATE_1e16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l159_l146_l164_DUPLICATE_1e16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l159_l146_l164_DUPLICATE_1e16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l159_l146_DUPLICATE_4b65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l159_l146_DUPLICATE_4b65_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l159_l146_DUPLICATE_e0a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l159_l146_DUPLICATE_e0a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l153_c7_2c42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l146_c2_dbed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l171_c3_38e0;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l174_c3_7d82;
     VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue := VAR_tmp16_uxn_opcodes_h_l150_c3_66f1;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l159_c7_5374] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l173_c7_110c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l181_c7_abe1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l164_c7_1847] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l177_c3_7511] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_left;
     BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_return_output := BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l146_c1_0c4d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l170_c3_3c0f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_return_output := CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l161_c24_4e51] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l161_c24_4e51_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l161_c34_57e9_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l181_c7_abe1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l153_c7_2c42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_right := VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_7511_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l161_c24_4e51_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l170_c3_3c0f_return_output;
     VAR_printf_uxn_opcodes_h_l147_c3_7db6_uxn_opcodes_h_l147_c3_7db6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l146_c1_0c4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l181_c7_abe1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l181_c7_abe1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l164_c7_1847_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l173_c7_110c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_5374_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l159_c7_5374] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_cond;
     result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_return_output := result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l159_c7_5374] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l153_c7_2c42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_375b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l168_c7_f9d0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output;

     -- printf_uxn_opcodes_h_l147_c3_7db6[uxn_opcodes_h_l147_c3_7db6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l147_c3_7db6_uxn_opcodes_h_l147_c3_7db6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l147_c3_7db6_uxn_opcodes_h_l147_c3_7db6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_375b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l179_c15_08ef] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_left;
     BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_return_output := BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l176_c7_375b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l176_c7_375b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_cond;
     tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_return_output := tmp16_MUX_uxn_opcodes_h_l176_c7_375b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_08ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_375b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_375b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5374_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_5374_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_375b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l173_c7_110c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l164_c7_1847] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_return_output := result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l153_c7_2c42] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_cond;
     result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_return_output := result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l173_c7_110c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l173_c7_110c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_cond;
     tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_return_output := tmp16_MUX_uxn_opcodes_h_l173_c7_110c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l179_c15_cdd2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l153_c7_2c42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l173_c7_110c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l179_c3_7f14 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c15_cdd2_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l173_c7_110c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l173_c7_110c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_1847_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l173_c7_110c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iftrue := VAR_result_pc_uxn_opcodes_h_l179_c3_7f14;
     -- result_pc_MUX[uxn_opcodes_h_l176_c7_375b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l176_c7_375b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_cond;
     result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_return_output := result_pc_MUX_uxn_opcodes_h_l176_c7_375b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l168_c7_f9d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_cond;
     tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output := tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l168_c7_f9d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l159_c7_5374] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_return_output := result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_return_output := result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l168_c7_f9d0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_375b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_5374_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l164_c7_1847] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l164_c7_1847_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_cond;
     tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iftrue;
     tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_return_output := tmp16_MUX_uxn_opcodes_h_l164_c7_1847_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l173_c7_110c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l173_c7_110c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_cond;
     result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_return_output := result_pc_MUX_uxn_opcodes_h_l173_c7_110c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l164_c7_1847] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l164_c7_1847] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l153_c7_2c42] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_return_output := result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_1847_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_1847_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l173_c7_110c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_1847_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l168_c7_f9d0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_cond;
     result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output := result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l159_c7_5374] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l159_c7_5374] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l159_c7_5374_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_cond;
     tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iftrue;
     tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_return_output := tmp16_MUX_uxn_opcodes_h_l159_c7_5374_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l159_c7_5374] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_return_output := result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5374_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5374_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l168_c7_f9d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5374_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l153_c7_2c42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l153_c7_2c42] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_cond;
     tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue;
     tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_return_output := tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l153_c7_2c42] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l164_c7_1847] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l164_c7_1847_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_cond;
     result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iftrue;
     result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_return_output := result_pc_MUX_uxn_opcodes_h_l164_c7_1847_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_1847_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_cond;
     tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_return_output := tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l159_c7_5374] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l159_c7_5374_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_cond;
     result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iftrue;
     result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_return_output := result_pc_MUX_uxn_opcodes_h_l159_c7_5374_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_5374_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l153_c7_2c42] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_cond;
     result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iftrue;
     result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_return_output := result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l153_c7_2c42_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l146_c2_dbed] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_cond;
     result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iftrue;
     result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_return_output := result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l142_l186_DUPLICATE_a5d3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l142_l186_DUPLICATE_a5d3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_210b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l146_c2_dbed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l146_c2_dbed_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l142_l186_DUPLICATE_a5d3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l142_l186_DUPLICATE_a5d3_return_output;
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
