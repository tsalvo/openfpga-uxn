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
 previous_stack_read : in unsigned(7 downto 0);
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
-- BIN_OP_EQ[uxn_opcodes_h_l154_c6_089e]
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l154_c1_9046]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l154_c2_bbeb]
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l155_c3_485e[uxn_opcodes_h_l155_c3_485e]
signal printf_uxn_opcodes_h_l155_c3_485e_uxn_opcodes_h_l155_c3_485e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l158_c11_b9fa]
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l161_c11_d408]
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l161_c7_c220]
signal tmp16_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_c220]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l161_c7_c220]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l161_c7_c220]
signal result_pc_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l161_c7_c220]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l161_c7_c220]
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l161_c7_c220]
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l161_c7_c220]
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_c220]
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l161_c7_c220]
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l167_c11_1842]
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l167_c7_4e43]
signal tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l167_c7_4e43]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l167_c7_4e43]
signal result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l167_c7_4e43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l167_c7_4e43]
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l167_c7_4e43]
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l167_c7_4e43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l167_c7_4e43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l167_c7_4e43]
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l169_c34_61d4]
signal CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_885f]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_dbdc]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_dbdc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_dbdc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_dbdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l171_c7_dbdc]
signal result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_dbdc]
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_dbdc]
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l176_c11_0161]
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l176_c7_fcd2]
signal tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_fcd2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_fcd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l176_c7_fcd2]
signal result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l176_c7_fcd2]
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l176_c7_fcd2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l179_c11_8e7a]
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l179_c7_7f0e]
signal tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_7f0e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_7f0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l179_c7_7f0e]
signal result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l179_c7_7f0e]
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l179_c7_7f0e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l181_c3_101d]
signal CONST_SL_8_uxn_opcodes_h_l181_c3_101d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l181_c3_101d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l182_c21_32e5]
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l184_c11_c736]
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l184_c7_1627]
signal tmp16_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l184_c7_1627]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l184_c7_1627]
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l184_c7_1627]
signal result_pc_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l184_c7_1627]
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l184_c7_1627]
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l185_c21_5c0d]
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l187_c11_2e83]
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l187_c7_e89b]
signal tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l187_c7_e89b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l187_c7_e89b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l187_c7_e89b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l187_c7_e89b]
signal result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l188_c3_49b7]
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_f61d]
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_adc4]
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_170c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
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
      base.is_pc_updated := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.pc := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.ram_addr := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e
BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_left,
BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_right,
BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_return_output);

-- tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb
tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb
result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb
result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

-- printf_uxn_opcodes_h_l155_c3_485e_uxn_opcodes_h_l155_c3_485e
printf_uxn_opcodes_h_l155_c3_485e_uxn_opcodes_h_l155_c3_485e : entity work.printf_uxn_opcodes_h_l155_c3_485e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l155_c3_485e_uxn_opcodes_h_l155_c3_485e_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_left,
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_right,
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408
BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_left,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_right,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output);

-- tmp16_MUX_uxn_opcodes_h_l161_c7_c220
tmp16_MUX_uxn_opcodes_h_l161_c7_c220 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l161_c7_c220_cond,
tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iftrue,
tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iffalse,
tmp16_MUX_uxn_opcodes_h_l161_c7_c220_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_return_output);

-- result_pc_MUX_uxn_opcodes_h_l161_c7_c220
result_pc_MUX_uxn_opcodes_h_l161_c7_c220 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l161_c7_c220_cond,
result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iftrue,
result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iffalse,
result_pc_MUX_uxn_opcodes_h_l161_c7_c220_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220
result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_cond,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_cond,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842
BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_left,
BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_right,
BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output);

-- tmp16_MUX_uxn_opcodes_h_l167_c7_4e43
tmp16_MUX_uxn_opcodes_h_l167_c7_4e43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_cond,
tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue,
tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse,
tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_return_output);

-- result_pc_MUX_uxn_opcodes_h_l167_c7_4e43
result_pc_MUX_uxn_opcodes_h_l167_c7_4e43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_cond,
result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue,
result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse,
result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43
result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_cond,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_cond,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_return_output);

-- CONST_SR_8_uxn_opcodes_h_l169_c34_61d4
CONST_SR_8_uxn_opcodes_h_l169_c34_61d4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_x,
CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f
BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc
tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc
result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_cond,
result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue,
result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse,
result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161
BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_left,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_right,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output);

-- tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2
tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_cond,
tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue,
tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse,
tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2
result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_cond,
result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue,
result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse,
result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a
BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_left,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_right,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e
tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_cond,
tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue,
tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse,
tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e
result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_cond,
result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue,
result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse,
result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l181_c3_101d
CONST_SL_8_uxn_opcodes_h_l181_c3_101d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l181_c3_101d_x,
CONST_SL_8_uxn_opcodes_h_l181_c3_101d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_left,
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_right,
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736
BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_left,
BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_right,
BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output);

-- tmp16_MUX_uxn_opcodes_h_l184_c7_1627
tmp16_MUX_uxn_opcodes_h_l184_c7_1627 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l184_c7_1627_cond,
tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iftrue,
tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iffalse,
tmp16_MUX_uxn_opcodes_h_l184_c7_1627_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_return_output);

-- result_pc_MUX_uxn_opcodes_h_l184_c7_1627
result_pc_MUX_uxn_opcodes_h_l184_c7_1627 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l184_c7_1627_cond,
result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iftrue,
result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iffalse,
result_pc_MUX_uxn_opcodes_h_l184_c7_1627_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_cond,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_left,
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_right,
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83
BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_left,
BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_right,
BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output);

-- tmp16_MUX_uxn_opcodes_h_l187_c7_e89b
tmp16_MUX_uxn_opcodes_h_l187_c7_e89b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_cond,
tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue,
tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse,
tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l187_c7_e89b
result_pc_MUX_uxn_opcodes_h_l187_c7_e89b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_cond,
result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue,
result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse,
result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7
BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_left,
BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_right,
BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_left,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_right,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_left,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_right,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_return_output,
 tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output,
 tmp16_MUX_uxn_opcodes_h_l161_c7_c220_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_return_output,
 result_pc_MUX_uxn_opcodes_h_l161_c7_c220_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output,
 tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_return_output,
 result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_return_output,
 CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output,
 result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output,
 tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output,
 result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output,
 tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output,
 result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output,
 CONST_SL_8_uxn_opcodes_h_l181_c3_101d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output,
 tmp16_MUX_uxn_opcodes_h_l184_c7_1627_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_return_output,
 result_pc_MUX_uxn_opcodes_h_l184_c7_1627_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output,
 tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_return_output,
 result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l158_c3_3eec : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_4a3e : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_bbeb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l155_c3_485e_uxn_opcodes_h_l155_c3_485e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_c220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_2ced : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_0ac7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_b4f1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_5e69_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l182_c3_5971 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_101d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_101d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l185_c3_94c0 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l191_c3_7a01 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d587_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_9f38_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_5c48_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_e3d6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_290b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_8c3e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_38f7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l188_l180_DUPLICATE_bd03_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_170c_uxn_opcodes_h_l150_l198_DUPLICATE_e245_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_4a3e := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_4a3e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_2ced := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_2ced;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_b4f1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_b4f1;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d587 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d587_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_e3d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_e3d6_return_output := result.is_ram_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l185_c21_5c0d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l158_c11_b9fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l184_c11_c736] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_left;
     BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output := BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_bbeb_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_38f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_38f7_return_output := result.is_opc_done;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_c220_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_8c3e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_8c3e_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l179_c11_8e7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l169_c34_61d4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_return_output := CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l167_c11_1842] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_left;
     BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output := BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_9f38 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_9f38_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_290b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_290b_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l188_l180_DUPLICATE_bd03 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l188_l180_DUPLICATE_bd03_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l187_c11_2e83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_left;
     BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output := BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l176_c11_0161] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_left;
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output := BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_885f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l154_c6_089e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_left;
     BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output := BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l182_c21_32e5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l161_c11_d408] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_left;
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output := BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_5c48 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_5c48_return_output := result.stack_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l165_c24_0ac7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_0ac7_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_089e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_d408_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_1842_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_885f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_0161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_8e7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_c736_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_2e83_return_output;
     VAR_tmp16_uxn_opcodes_h_l158_c3_3eec := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b9fa_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l182_c3_5971 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_32e5_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l185_c3_94c0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_5c0d_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l188_l180_DUPLICATE_bd03_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_101d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l188_l180_DUPLICATE_bd03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_0ac7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_c08c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_8c3e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_8c3e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_8c3e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_8c3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_38f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_38f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_38f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_38f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_38f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_38f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_38f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d587_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d587_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d587_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d587_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d587_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d587_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d587_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_e3d6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_e3d6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_e3d6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_e3d6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_e3d6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_e3d6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_e3d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_290b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_290b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_290b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_9f38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_9f38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_5c48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_5c48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_c220_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_bbeb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l182_c3_5971;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l185_c3_94c0;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue := VAR_tmp16_uxn_opcodes_h_l158_c3_3eec;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l167_c7_4e43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l187_c7_e89b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l187_c7_e89b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l181_c3_101d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l181_c3_101d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_101d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_101d_return_output := CONST_SL_8_uxn_opcodes_h_l181_c3_101d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_dbdc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l184_c7_1627] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_return_output := result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l187_c7_e89b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l188_c3_49b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_left;
     BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_return_output := BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l169_c24_5e69] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_5e69_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_61d4_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l154_c1_9046] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_right := VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_49b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_5e69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_101d_return_output;
     VAR_printf_uxn_opcodes_h_l155_c3_485e_uxn_opcodes_h_l155_c3_485e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_9046_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_e89b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_e89b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_e89b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c220_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_1627_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l167_c7_4e43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l184_c7_1627] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l167_c7_4e43] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_cond;
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_return_output := result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;

     -- printf_uxn_opcodes_h_l155_c3_485e[uxn_opcodes_h_l155_c3_485e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l155_c3_485e_uxn_opcodes_h_l155_c3_485e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l155_c3_485e_uxn_opcodes_h_l155_c3_485e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l184_c7_1627] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l187_c7_e89b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_cond;
     tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_return_output := tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l184_c7_1627] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_f61d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l179_c7_7f0e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_f61d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_1627_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_1627_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_1627_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c220_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_e89b_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l176_c7_fcd2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l184_c7_1627] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l184_c7_1627_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_cond;
     tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iftrue;
     tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_return_output := tmp16_MUX_uxn_opcodes_h_l184_c7_1627_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_adc4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l179_c7_7f0e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_7f0e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_cond;
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_return_output := result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_7f0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l191_c3_7a01 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_adc4_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c220_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c220_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_1627_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue := VAR_result_pc_uxn_opcodes_h_l191_c3_7a01;
     -- result_pc_MUX[uxn_opcodes_h_l187_c7_e89b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_cond;
     result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_return_output := result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_fcd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_dbdc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_fcd2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l179_c7_7f0e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_cond;
     tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output := tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l176_c7_fcd2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_e89b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_dbdc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l167_c7_4e43] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_return_output := result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_dbdc] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_dbdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l184_c7_1627] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l184_c7_1627_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_cond;
     result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iftrue;
     result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_return_output := result_pc_MUX_uxn_opcodes_h_l184_c7_1627_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l176_c7_fcd2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_cond;
     tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output := tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_1627_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l167_c7_4e43] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_return_output := result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l167_c7_4e43] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l179_c7_7f0e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_cond;
     result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output := result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_dbdc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l167_c7_4e43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_7f0e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c220_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l176_c7_fcd2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_cond;
     result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output := result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l167_c7_4e43] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_cond;
     tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue;
     tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_return_output := tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c220_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c220_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c220_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_fcd2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l161_c7_c220_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_cond;
     tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iftrue;
     tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_return_output := tmp16_MUX_uxn_opcodes_h_l161_c7_c220_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l171_c7_dbdc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_cond;
     result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output := result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_dbdc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c220_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l167_c7_4e43] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_cond;
     result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iftrue;
     result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_return_output := result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e43_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l161_c7_c220] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l161_c7_c220_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_cond;
     result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iftrue;
     result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_return_output := result_pc_MUX_uxn_opcodes_h_l161_c7_c220_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c220_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l154_c2_bbeb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_cond;
     result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output := result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_170c_uxn_opcodes_h_l150_l198_DUPLICATE_e245 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_170c_uxn_opcodes_h_l150_l198_DUPLICATE_e245_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_170c(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_bbeb_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_170c_uxn_opcodes_h_l150_l198_DUPLICATE_e245_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_170c_uxn_opcodes_h_l150_l198_DUPLICATE_e245_return_output;
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
