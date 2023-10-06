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
-- Submodules: 82
entity jsi_0CLK_a05d6369 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_a05d6369;
architecture arch of jsi_0CLK_a05d6369 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l154_c6_72ba]
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l154_c1_d187]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l154_c2_2e15]
signal tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l154_c2_2e15]
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l154_c2_2e15]
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l154_c2_2e15]
signal result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l154_c2_2e15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l154_c2_2e15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c2_2e15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c2_2e15]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c2_2e15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l154_c2_2e15]
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l154_c2_2e15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l155_c3_a5ab[uxn_opcodes_h_l155_c3_a5ab]
signal printf_uxn_opcodes_h_l155_c3_a5ab_uxn_opcodes_h_l155_c3_a5ab_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l158_c11_e714]
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l161_c11_86f4]
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l161_c7_05ff]
signal tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l161_c7_05ff]
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l161_c7_05ff]
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l161_c7_05ff]
signal result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l161_c7_05ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l161_c7_05ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_05ff]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l161_c7_05ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l161_c7_05ff]
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_05ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l167_c11_f322]
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l167_c7_aaa6]
signal tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l167_c7_aaa6]
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l167_c7_aaa6]
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l167_c7_aaa6]
signal result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l167_c7_aaa6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l167_c7_aaa6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l167_c7_aaa6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l167_c7_aaa6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l167_c7_aaa6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l169_c34_0af3]
signal CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_4200]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_0c83]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_0c83]
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_0c83]
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l171_c7_0c83]
signal result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_0c83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_0c83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_0c83]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l176_c11_b6c6]
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l176_c7_7d39]
signal tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l176_c7_7d39]
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l176_c7_7d39]
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l176_c7_7d39]
signal result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_7d39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_7d39]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l179_c11_3db7]
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l179_c7_20da]
signal tmp16_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l179_c7_20da]
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l179_c7_20da]
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l179_c7_20da]
signal result_pc_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_20da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_20da]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l181_c3_4222]
signal CONST_SL_8_uxn_opcodes_h_l181_c3_4222_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l181_c3_4222_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l182_c21_a4f5]
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l184_c11_b969]
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l184_c7_4263]
signal tmp16_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l184_c7_4263]
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l184_c7_4263]
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l184_c7_4263]
signal result_pc_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l184_c7_4263]
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l184_c7_4263]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l185_c21_39f1]
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l187_c11_df1a]
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l187_c7_804a]
signal tmp16_MUX_uxn_opcodes_h_l187_c7_804a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_804a_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l187_c7_804a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l187_c7_804a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l187_c7_804a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l187_c7_804a]
signal result_pc_MUX_uxn_opcodes_h_l187_c7_804a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_804a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l188_c3_d3e8]
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_bf11]
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_b445]
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2e50( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.ram_addr := ref_toks_2;
      base.pc := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_ram_read := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba
BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_left,
BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_right,
BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_return_output);

-- tmp16_MUX_uxn_opcodes_h_l154_c2_2e15
tmp16_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15
result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- result_pc_MUX_uxn_opcodes_h_l154_c2_2e15
result_pc_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

-- printf_uxn_opcodes_h_l155_c3_a5ab_uxn_opcodes_h_l155_c3_a5ab
printf_uxn_opcodes_h_l155_c3_a5ab_uxn_opcodes_h_l155_c3_a5ab : entity work.printf_uxn_opcodes_h_l155_c3_a5ab_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l155_c3_a5ab_uxn_opcodes_h_l155_c3_a5ab_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_left,
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_right,
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4
BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_left,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_right,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l161_c7_05ff
tmp16_MUX_uxn_opcodes_h_l161_c7_05ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_cond,
tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff
result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_cond,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_return_output);

-- result_pc_MUX_uxn_opcodes_h_l161_c7_05ff
result_pc_MUX_uxn_opcodes_h_l161_c7_05ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_cond,
result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue,
result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse,
result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322
BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_left,
BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_right,
BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output);

-- tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6
tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_cond,
tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue,
tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse,
tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6
result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_cond,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6
result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_cond,
result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue,
result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse,
result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l169_c34_0af3
CONST_SR_8_uxn_opcodes_h_l169_c34_0af3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_x,
CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200
BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_0c83
tmp16_MUX_uxn_opcodes_h_l171_c7_0c83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_cond,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_return_output);

-- result_pc_MUX_uxn_opcodes_h_l171_c7_0c83
result_pc_MUX_uxn_opcodes_h_l171_c7_0c83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_cond,
result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue,
result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse,
result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6
BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_left,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_right,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l176_c7_7d39
tmp16_MUX_uxn_opcodes_h_l176_c7_7d39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_cond,
tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue,
tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse,
tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_cond,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_return_output);

-- result_pc_MUX_uxn_opcodes_h_l176_c7_7d39
result_pc_MUX_uxn_opcodes_h_l176_c7_7d39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_cond,
result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue,
result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse,
result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7
BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_left,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_right,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l179_c7_20da
tmp16_MUX_uxn_opcodes_h_l179_c7_20da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l179_c7_20da_cond,
tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iftrue,
tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iffalse,
tmp16_MUX_uxn_opcodes_h_l179_c7_20da_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_cond,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_return_output);

-- result_pc_MUX_uxn_opcodes_h_l179_c7_20da
result_pc_MUX_uxn_opcodes_h_l179_c7_20da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l179_c7_20da_cond,
result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iftrue,
result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iffalse,
result_pc_MUX_uxn_opcodes_h_l179_c7_20da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_return_output);

-- CONST_SL_8_uxn_opcodes_h_l181_c3_4222
CONST_SL_8_uxn_opcodes_h_l181_c3_4222 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l181_c3_4222_x,
CONST_SL_8_uxn_opcodes_h_l181_c3_4222_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_left,
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_right,
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969
BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_left,
BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_right,
BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output);

-- tmp16_MUX_uxn_opcodes_h_l184_c7_4263
tmp16_MUX_uxn_opcodes_h_l184_c7_4263 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l184_c7_4263_cond,
tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iftrue,
tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iffalse,
tmp16_MUX_uxn_opcodes_h_l184_c7_4263_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_cond,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_return_output);

-- result_pc_MUX_uxn_opcodes_h_l184_c7_4263
result_pc_MUX_uxn_opcodes_h_l184_c7_4263 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l184_c7_4263_cond,
result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iftrue,
result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iffalse,
result_pc_MUX_uxn_opcodes_h_l184_c7_4263_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_left,
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_right,
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a
BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_left,
BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_right,
BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l187_c7_804a
tmp16_MUX_uxn_opcodes_h_l187_c7_804a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l187_c7_804a_cond,
tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iftrue,
tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iffalse,
tmp16_MUX_uxn_opcodes_h_l187_c7_804a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l187_c7_804a
result_pc_MUX_uxn_opcodes_h_l187_c7_804a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l187_c7_804a_cond,
result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iftrue,
result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iffalse,
result_pc_MUX_uxn_opcodes_h_l187_c7_804a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8
BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_left,
BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_right,
BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_left,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_right,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_left,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_right,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_return_output,
 tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output,
 tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_return_output,
 result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output,
 tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output,
 result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output,
 CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_return_output,
 result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output,
 tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_return_output,
 result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output,
 tmp16_MUX_uxn_opcodes_h_l179_c7_20da_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_return_output,
 result_pc_MUX_uxn_opcodes_h_l179_c7_20da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_return_output,
 CONST_SL_8_uxn_opcodes_h_l181_c3_4222_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output,
 tmp16_MUX_uxn_opcodes_h_l184_c7_4263_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_return_output,
 result_pc_MUX_uxn_opcodes_h_l184_c7_4263_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output,
 tmp16_MUX_uxn_opcodes_h_l187_c7_804a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_return_output,
 result_pc_MUX_uxn_opcodes_h_l187_c7_804a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l158_c3_182f : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_4e69 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_2e15_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l155_c3_a5ab_uxn_opcodes_h_l155_c3_a5ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_c7bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_05ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_6fbf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_94b6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_29df_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l182_c3_d45f : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_4222_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_4222_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l185_c3_12e2 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l191_c3_e6ad : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l154_l167_DUPLICATE_3942_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l154_l167_l184_DUPLICATE_7736_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l171_l167_DUPLICATE_c8d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l154_l167_DUPLICATE_d6ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l167_l161_l171_l179_l184_l176_l154_DUPLICATE_1b74_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l167_l161_l179_l187_l184_l176_l154_DUPLICATE_397a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_DUPLICATE_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l180_l188_DUPLICATE_3fb6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2e50_uxn_opcodes_h_l198_l150_DUPLICATE_99cb_return_output : opcode_result_t;
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
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_right := to_unsigned(7, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_4e69 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_4e69;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_c7bc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_c7bc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_94b6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_94b6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_4200] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l179_c11_3db7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_left;
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output := BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l184_c11_b969] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_left;
     BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output := BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l154_l167_DUPLICATE_3942 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l154_l167_DUPLICATE_3942_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_DUPLICATE_ccdc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_DUPLICATE_ccdc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l154_c6_72ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l161_c11_86f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l154_l167_l184_DUPLICATE_7736 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l154_l167_l184_DUPLICATE_7736_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l167_l161_l171_l179_l184_l176_l154_DUPLICATE_1b74 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l167_l161_l171_l179_l184_l176_l154_DUPLICATE_1b74_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l154_l167_DUPLICATE_d6ec LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l154_l167_DUPLICATE_d6ec_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l165_c24_6fbf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_6fbf_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_PLUS[uxn_opcodes_h_l182_c21_a4f5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l187_c11_df1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l185_c21_39f1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0_return_output := result.pc;

     -- BIN_OP_PLUS[uxn_opcodes_h_l158_c11_e714] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_left;
     BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_return_output := BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_2e15_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l169_c34_0af3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_return_output := CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_05ff_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l171_l167_DUPLICATE_c8d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l171_l167_DUPLICATE_c8d8_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l176_c11_b6c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l167_c11_f322] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_left;
     BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output := BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l167_l161_l179_l187_l184_l176_l154_DUPLICATE_397a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l167_l161_l179_l187_l184_l176_l154_DUPLICATE_397a_return_output := result.is_ram_read;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l180_l188_DUPLICATE_3fb6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l180_l188_DUPLICATE_3fb6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_72ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_86f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_f322_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4200_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_b6c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3db7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_b969_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_df1a_return_output;
     VAR_tmp16_uxn_opcodes_h_l158_c3_182f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_e714_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l182_c3_d45f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_a4f5_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l185_c3_12e2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_39f1_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l180_l188_DUPLICATE_3fb6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_4222_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l180_l188_DUPLICATE_3fb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_6fbf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_l154_DUPLICATE_10c0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l154_l167_l184_DUPLICATE_7736_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l154_l167_l184_DUPLICATE_7736_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l154_l167_l184_DUPLICATE_7736_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l154_l167_l184_DUPLICATE_7736_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_DUPLICATE_ccdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_DUPLICATE_ccdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_DUPLICATE_ccdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_DUPLICATE_ccdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_DUPLICATE_ccdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_DUPLICATE_ccdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l167_l161_l171_l179_l187_l184_l176_DUPLICATE_ccdc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l167_l161_l171_l179_l184_l176_l154_DUPLICATE_1b74_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l167_l161_l171_l179_l184_l176_l154_DUPLICATE_1b74_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l167_l161_l171_l179_l184_l176_l154_DUPLICATE_1b74_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l167_l161_l171_l179_l184_l176_l154_DUPLICATE_1b74_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l167_l161_l171_l179_l184_l176_l154_DUPLICATE_1b74_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l167_l161_l171_l179_l184_l176_l154_DUPLICATE_1b74_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l167_l161_l171_l179_l184_l176_l154_DUPLICATE_1b74_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l167_l161_l179_l187_l184_l176_l154_DUPLICATE_397a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l167_l161_l179_l187_l184_l176_l154_DUPLICATE_397a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l167_l161_l179_l187_l184_l176_l154_DUPLICATE_397a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l167_l161_l179_l187_l184_l176_l154_DUPLICATE_397a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l167_l161_l179_l187_l184_l176_l154_DUPLICATE_397a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l167_l161_l179_l187_l184_l176_l154_DUPLICATE_397a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l167_l161_l179_l187_l184_l176_l154_DUPLICATE_397a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l171_l167_DUPLICATE_c8d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l171_l167_DUPLICATE_c8d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l171_l167_DUPLICATE_c8d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l154_l167_DUPLICATE_d6ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l154_l167_DUPLICATE_d6ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l154_l167_DUPLICATE_3942_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l154_l167_DUPLICATE_3942_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_05ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_2e15_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l182_c3_d45f;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l185_c3_12e2;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue := VAR_tmp16_uxn_opcodes_h_l158_c3_182f;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l187_c7_804a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l181_c3_4222] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l181_c3_4222_x <= VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_4222_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_4222_return_output := CONST_SL_8_uxn_opcodes_h_l181_c3_4222_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l154_c1_d187] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l187_c7_804a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_0c83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l169_c24_29df] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_29df_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_0af3_return_output);

     -- result_ram_addr_MUX[uxn_opcodes_h_l184_c7_4263] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_return_output := result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l187_c7_804a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l188_c3_d3e8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_left;
     BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_return_output := BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l167_c7_aaa6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_right := VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_d3e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_29df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_4222_return_output;
     VAR_printf_uxn_opcodes_h_l155_c3_a5ab_uxn_opcodes_h_l155_c3_a5ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_d187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_804a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_804a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_804a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_4263_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l167_c7_aaa6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;

     -- printf_uxn_opcodes_h_l155_c3_a5ab[uxn_opcodes_h_l155_c3_a5ab] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l155_c3_a5ab_uxn_opcodes_h_l155_c3_a5ab_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l155_c3_a5ab_uxn_opcodes_h_l155_c3_a5ab_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l184_c7_4263] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l184_c7_4263] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l179_c7_20da] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_return_output := result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l184_c7_4263] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l167_c7_aaa6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output := result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l187_c7_804a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l187_c7_804a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_cond;
     tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_return_output := tmp16_MUX_uxn_opcodes_h_l187_c7_804a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_bf11] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_left;
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_return_output := BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_bf11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_4263_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_4263_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_4263_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_20da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_804a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_20da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_b445] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_left;
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_return_output := BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l179_c7_20da] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_20da] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l176_c7_7d39] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_return_output := result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l184_c7_4263] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l184_c7_4263_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_cond;
     tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iftrue;
     tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_return_output := tmp16_MUX_uxn_opcodes_h_l184_c7_4263_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l191_c3_e6ad := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_b445_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_20da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_20da_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_20da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_4263_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iftrue := VAR_result_pc_uxn_opcodes_h_l191_c3_e6ad;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_7d39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l187_c7_804a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l187_c7_804a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_cond;
     result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_return_output := result_pc_MUX_uxn_opcodes_h_l187_c7_804a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_0c83] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_return_output := result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l179_c7_20da] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l179_c7_20da_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_cond;
     tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iftrue;
     tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_return_output := tmp16_MUX_uxn_opcodes_h_l179_c7_20da_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_7d39] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l176_c7_7d39] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_804a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_20da_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l167_c7_aaa6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l176_c7_7d39] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_cond;
     tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue;
     tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_return_output := tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_0c83] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l184_c7_4263] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l184_c7_4263_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_cond;
     result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iftrue;
     result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_return_output := result_pc_MUX_uxn_opcodes_h_l184_c7_4263_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_0c83] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_0c83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_4263_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l171_c7_0c83] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_return_output := result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l167_c7_aaa6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l179_c7_20da] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l179_c7_20da_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_cond;
     result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iftrue;
     result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_return_output := result_pc_MUX_uxn_opcodes_h_l179_c7_20da_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l167_c7_aaa6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l167_c7_aaa6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_20da_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l176_c7_7d39] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_cond;
     result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iftrue;
     result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_return_output := result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l167_c7_aaa6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_cond;
     tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output := tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_7d39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_cond;
     tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_return_output := tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l171_c7_0c83] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_cond;
     result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iftrue;
     result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_return_output := result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_0c83_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l167_c7_aaa6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_cond;
     result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output := result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_aaa6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l161_c7_05ff] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_cond;
     result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iftrue;
     result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_return_output := result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_05ff_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l154_c2_2e15] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_cond;
     result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iftrue;
     result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_return_output := result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2e50_uxn_opcodes_h_l198_l150_DUPLICATE_99cb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2e50_uxn_opcodes_h_l198_l150_DUPLICATE_99cb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2e50(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_2e15_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_2e15_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2e50_uxn_opcodes_h_l198_l150_DUPLICATE_99cb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2e50_uxn_opcodes_h_l198_l150_DUPLICATE_99cb_return_output;
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
