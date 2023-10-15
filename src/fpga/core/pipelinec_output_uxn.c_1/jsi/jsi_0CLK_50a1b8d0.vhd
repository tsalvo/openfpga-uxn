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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 69
entity jsi_0CLK_50a1b8d0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_50a1b8d0;
architecture arch of jsi_0CLK_50a1b8d0 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_a859]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_1a7d]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_1a7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_1a7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l144_c2_1a7d]
signal result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_1a7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_1a7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l144_c2_1a7d]
signal result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_1a7d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l144_c2_1a7d]
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l144_c2_1a7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_ffdc]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l151_c11_90b2]
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l151_c7_5d45]
signal tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l151_c7_5d45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l151_c7_5d45]
signal result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l151_c7_5d45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l151_c7_5d45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l151_c7_5d45]
signal result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l151_c7_5d45]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l151_c7_5d45]
signal result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l151_c7_5d45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l157_c11_8ecd]
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l157_c7_db74]
signal tmp16_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l157_c7_db74]
signal result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_db74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l157_c7_db74]
signal result_pc_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_db74]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_db74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l157_c7_db74]
signal result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_db74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l159_c34_cc40]
signal CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l162_c11_29c7]
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l162_c7_b081]
signal tmp16_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l162_c7_b081]
signal result_pc_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_b081]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l162_c7_b081]
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l162_c7_b081]
signal result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_b081]
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_440e]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_40e1]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l166_c7_40e1]
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l166_c7_40e1]
signal result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_40e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_40e1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_caaa]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c21_f8b8]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_333c]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_c183]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_c183_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_c183_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_c183]
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l171_c7_c183]
signal result_pc_MUX_uxn_opcodes_h_l171_c7_c183_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_c183_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_c183]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_c183]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l172_c21_3834]
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l174_c11_e400]
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l174_c7_e18c]
signal tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l174_c7_e18c]
signal result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_e18c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_e18c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l175_c3_2529]
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c15_915a]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c15_8d72]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l179_c11_ed82]
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_c4df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_c4df]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_610b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.ram_addr := ref_toks_8;
      base.is_sp_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859
BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d
tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d
result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_cond,
result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue,
result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse,
result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d
result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_cond,
result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d
result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2
BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_left,
BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_right,
BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l151_c7_5d45
tmp16_MUX_uxn_opcodes_h_l151_c7_5d45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_cond,
tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue,
tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse,
tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_return_output);

-- result_pc_MUX_uxn_opcodes_h_l151_c7_5d45
result_pc_MUX_uxn_opcodes_h_l151_c7_5d45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_cond,
result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue,
result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse,
result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45
result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_cond,
result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45
result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_cond,
result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd
BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_left,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_right,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l157_c7_db74
tmp16_MUX_uxn_opcodes_h_l157_c7_db74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l157_c7_db74_cond,
tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iftrue,
tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iffalse,
tmp16_MUX_uxn_opcodes_h_l157_c7_db74_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74
result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_cond,
result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_return_output);

-- result_pc_MUX_uxn_opcodes_h_l157_c7_db74
result_pc_MUX_uxn_opcodes_h_l157_c7_db74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l157_c7_db74_cond,
result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iftrue,
result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iffalse,
result_pc_MUX_uxn_opcodes_h_l157_c7_db74_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74
result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_cond,
result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_return_output);

-- CONST_SR_8_uxn_opcodes_h_l159_c34_cc40
CONST_SR_8_uxn_opcodes_h_l159_c34_cc40 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_x,
CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7
BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_left,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_right,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l162_c7_b081
tmp16_MUX_uxn_opcodes_h_l162_c7_b081 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l162_c7_b081_cond,
tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iftrue,
tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iffalse,
tmp16_MUX_uxn_opcodes_h_l162_c7_b081_return_output);

-- result_pc_MUX_uxn_opcodes_h_l162_c7_b081
result_pc_MUX_uxn_opcodes_h_l162_c7_b081 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l162_c7_b081_cond,
result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iftrue,
result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iffalse,
result_pc_MUX_uxn_opcodes_h_l162_c7_b081_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081
result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_cond,
result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e
BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_40e1
tmp16_MUX_uxn_opcodes_h_l166_c7_40e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1
result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l166_c7_40e1
result_pc_MUX_uxn_opcodes_h_l166_c7_40e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_cond,
result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue,
result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse,
result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_caaa
CONST_SL_8_uxn_opcodes_h_l168_c3_caaa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8
BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c
BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_c183
tmp16_MUX_uxn_opcodes_h_l171_c7_c183 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_c183_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_c183_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_cond,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_return_output);

-- result_pc_MUX_uxn_opcodes_h_l171_c7_c183
result_pc_MUX_uxn_opcodes_h_l171_c7_c183 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l171_c7_c183_cond,
result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iftrue,
result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iffalse,
result_pc_MUX_uxn_opcodes_h_l171_c7_c183_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834
BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_left,
BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_right,
BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400
BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_left,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_right,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_return_output);

-- tmp16_MUX_uxn_opcodes_h_l174_c7_e18c
tmp16_MUX_uxn_opcodes_h_l174_c7_e18c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_cond,
tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue,
tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse,
tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l174_c7_e18c
result_pc_MUX_uxn_opcodes_h_l174_c7_e18c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_cond,
result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue,
result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse,
result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l175_c3_2529
BIN_OP_OR_uxn_opcodes_h_l175_c3_2529 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_left,
BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_right,
BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82
BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_left,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_right,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
 result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_return_output,
 result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output,
 tmp16_MUX_uxn_opcodes_h_l157_c7_db74_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_return_output,
 result_pc_MUX_uxn_opcodes_h_l157_c7_db74_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_return_output,
 CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output,
 tmp16_MUX_uxn_opcodes_h_l162_c7_b081_return_output,
 result_pc_MUX_uxn_opcodes_h_l162_c7_b081_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_return_output,
 result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_c183_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_return_output,
 result_pc_MUX_uxn_opcodes_h_l171_c7_c183_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_return_output,
 tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_return_output,
 result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_6606 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_d9db : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_1a7d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_88f3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_5d45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c24_8cb9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_cd3c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c24_2c98_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l169_c3_ab5b : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l172_c3_3212 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l177_c3_41e5 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_d2cc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l157_l151_l144_l174_l171_l166_l162_DUPLICATE_2305_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_bd5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_ed24_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l151_l179_l144_l171_l166_l162_DUPLICATE_380b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_41f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l151_l179_l174_l171_l166_l162_DUPLICATE_1fc6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l175_DUPLICATE_1cd2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l184_l140_DUPLICATE_cf1d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_88f3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_88f3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_cd3c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_cd3c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_d9db := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_d9db;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_ed24 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_ed24_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l175_DUPLICATE_1cd2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l175_DUPLICATE_1cd2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l157_l151_l144_l174_l171_l166_l162_DUPLICATE_2305 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l157_l151_l144_l174_l171_l166_l162_DUPLICATE_2305_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l151_c11_90b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_41f4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_41f4_return_output := result.ram_addr;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l151_c7_5d45] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_5d45_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_d2cc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_d2cc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l157_c11_8ecd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_left;
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output := BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l174_c11_e400] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_left;
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_return_output := BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c21_f8b8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_bd5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_bd5a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l162_c11_29c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l155_c24_8cb9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c24_8cb9_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_SR_8[uxn_opcodes_h_l159_c34_cc40] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_x <= VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_return_output := CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_ffdc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l179_c11_ed82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_left;
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_return_output := BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l151_l179_l174_l171_l166_l162_DUPLICATE_1fc6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l151_l179_l174_l171_l166_l162_DUPLICATE_1fc6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_a859] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_333c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l172_c21_3834] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_left;
     BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_return_output := BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_440e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_1a7d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l151_l179_l144_l171_l166_l162_DUPLICATE_380b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l151_l179_l144_l171_l166_l162_DUPLICATE_380b_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_a859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_90b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_8ecd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_29c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_440e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_333c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_e400_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_ed82_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_6606 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_ffdc_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l169_c3_ab5b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_f8b8_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l172_c3_3212 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_3834_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l175_DUPLICATE_1cd2_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l175_DUPLICATE_1cd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c24_8cb9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l157_l151_l144_l174_l171_l166_l162_DUPLICATE_2305_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l157_l151_l144_l174_l171_l166_l162_DUPLICATE_2305_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l157_l151_l144_l174_l171_l166_l162_DUPLICATE_2305_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l157_l151_l144_l174_l171_l166_l162_DUPLICATE_2305_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l157_l151_l144_l174_l171_l166_l162_DUPLICATE_2305_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l157_l151_l144_l174_l171_l166_l162_DUPLICATE_2305_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l157_l151_l144_l174_l171_l166_l162_DUPLICATE_2305_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_41f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_41f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_41f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l151_l179_l174_l171_l166_l162_DUPLICATE_1fc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l151_l179_l174_l171_l166_l162_DUPLICATE_1fc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l151_l179_l174_l171_l166_l162_DUPLICATE_1fc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l151_l179_l174_l171_l166_l162_DUPLICATE_1fc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l151_l179_l174_l171_l166_l162_DUPLICATE_1fc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l151_l179_l174_l171_l166_l162_DUPLICATE_1fc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l151_l179_l174_l171_l166_l162_DUPLICATE_1fc6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l151_l179_l144_l171_l166_l162_DUPLICATE_380b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l151_l179_l144_l171_l166_l162_DUPLICATE_380b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l151_l179_l144_l171_l166_l162_DUPLICATE_380b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l151_l179_l144_l171_l166_l162_DUPLICATE_380b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l151_l179_l144_l171_l166_l162_DUPLICATE_380b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l151_l179_l144_l171_l166_l162_DUPLICATE_380b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l151_l179_l144_l171_l166_l162_DUPLICATE_380b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_bd5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_bd5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_bd5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_d2cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_d2cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_ed24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_ed24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_5d45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_1a7d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l169_c3_ab5b;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l172_c3_3212;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_6606;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_db74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_c4df] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_c4df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l175_c3_2529] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_left;
     BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_return_output := BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l159_c24_2c98] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c24_2c98_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_cc40_return_output);

     -- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_c183] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_return_output := result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_caaa] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l151_c7_5d45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l162_c7_b081] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_right := VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_2529_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c24_2c98_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_caaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c4df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c4df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_b081_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c183_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_db74_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l151_c7_5d45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l166_c7_40e1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c15_915a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_e18c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l157_c7_db74] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_cond;
     result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_return_output := result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_db74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_e18c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l174_c7_e18c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_cond;
     tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_return_output := tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_915a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e18c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e18c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_db74_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_40e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_db74_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e18c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l151_c7_5d45] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_cond;
     result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_return_output := result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l151_c7_5d45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l162_c7_b081] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_return_output := result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_c183] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_c183_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_c183_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_c183] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c15_8d72] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_c183] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l177_c3_41e5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_8d72_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c183_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c183_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_b081_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c183_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue := VAR_result_pc_uxn_opcodes_h_l177_c3_41e5;
     -- result_stack_value_MUX[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output := result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_40e1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_40e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_40e1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l157_c7_db74] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_return_output := result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l174_c7_e18c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_cond;
     result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_return_output := result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_40e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_40e1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_e18c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_db74_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_40e1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l162_c7_b081] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l162_c7_b081_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_cond;
     tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iftrue;
     tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_return_output := tmp16_MUX_uxn_opcodes_h_l162_c7_b081_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l151_c7_5d45] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_return_output := result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l171_c7_c183] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l171_c7_c183_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_cond;
     result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iftrue;
     result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_return_output := result_pc_MUX_uxn_opcodes_h_l171_c7_c183_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_b081] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_b081] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_b081_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_b081_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c183_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_b081_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_db74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l157_c7_db74] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l157_c7_db74_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_cond;
     tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iftrue;
     tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_return_output := tmp16_MUX_uxn_opcodes_h_l157_c7_db74_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_db74] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l166_c7_40e1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_cond;
     result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_return_output := result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_db74_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_db74_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_40e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_db74_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l151_c7_5d45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l162_c7_b081] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l162_c7_b081_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_cond;
     result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iftrue;
     result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_return_output := result_pc_MUX_uxn_opcodes_h_l162_c7_b081_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l151_c7_5d45] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_cond;
     tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue;
     tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_return_output := tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l151_c7_5d45] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_b081_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l157_c7_db74] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l157_c7_db74_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_cond;
     result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iftrue;
     result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_return_output := result_pc_MUX_uxn_opcodes_h_l157_c7_db74_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_db74_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l151_c7_5d45] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_cond;
     result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iftrue;
     result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_return_output := result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_5d45_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l144_c2_1a7d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_cond;
     result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output := result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l184_l140_DUPLICATE_cf1d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l184_l140_DUPLICATE_cf1d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_610b(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_1a7d_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l184_l140_DUPLICATE_cf1d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l184_l140_DUPLICATE_cf1d_return_output;
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
