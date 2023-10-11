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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_b9a4]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l144_c1_63b3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_b56d]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_b56d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l144_c2_b56d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_b56d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_b56d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l144_c2_b56d]
signal result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_b56d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l144_c2_b56d]
signal result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_b56d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l144_c2_b56d]
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l145_c3_bf2b[uxn_opcodes_h_l145_c3_bf2b]
signal printf_uxn_opcodes_h_l145_c3_bf2b_uxn_opcodes_h_l145_c3_bf2b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_b249]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l151_c11_f0c1]
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l151_c7_f9b8]
signal tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l151_c7_f9b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l151_c7_f9b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l151_c7_f9b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l151_c7_f9b8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l151_c7_f9b8]
signal result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l151_c7_f9b8]
signal result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l151_c7_f9b8]
signal result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l151_c7_f9b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l157_c11_4a9f]
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l157_c7_fe1c]
signal tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_fe1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l157_c7_fe1c]
signal result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_fe1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_fe1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_fe1c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l157_c7_fe1c]
signal result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l157_c7_fe1c]
signal result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l159_c34_9914]
signal CONST_SR_8_uxn_opcodes_h_l159_c34_9914_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l159_c34_9914_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l162_c11_43bc]
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l162_c7_1bd2]
signal tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_1bd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l162_c7_1bd2]
signal result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l162_c7_1bd2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_1bd2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l162_c7_1bd2]
signal result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_b914]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_8ede]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_8ede]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l166_c7_8ede]
signal result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_8ede]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l166_c7_8ede]
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_2c1e]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c21_e48c]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_0772]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_1154]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_1154_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_1154_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_1154]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l171_c7_1154]
signal result_pc_MUX_uxn_opcodes_h_l171_c7_1154_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_1154_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_1154]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_1154]
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l172_c21_5238]
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l174_c11_f191]
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l174_c7_d778]
signal tmp16_MUX_uxn_opcodes_h_l174_c7_d778_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_d778_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_d778]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l174_c7_d778]
signal result_pc_MUX_uxn_opcodes_h_l174_c7_d778_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l174_c7_d778_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_d778]
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l175_c3_3c16]
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c15_5d4f]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c15_fe82]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l179_c11_5dec]
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_7b1f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_7b1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_77ce( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.pc := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.ram_addr := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4
BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_b56d
tmp16_MUX_uxn_opcodes_h_l144_c2_b56d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d
result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_cond,
result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l144_c2_b56d
result_pc_MUX_uxn_opcodes_h_l144_c2_b56d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_cond,
result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue,
result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse,
result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d
result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

-- printf_uxn_opcodes_h_l145_c3_bf2b_uxn_opcodes_h_l145_c3_bf2b
printf_uxn_opcodes_h_l145_c3_bf2b_uxn_opcodes_h_l145_c3_bf2b : entity work.printf_uxn_opcodes_h_l145_c3_bf2b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l145_c3_bf2b_uxn_opcodes_h_l145_c3_bf2b_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1
BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_left,
BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_right,
BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8
tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_cond,
tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue,
tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse,
tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8
result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8
result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8
result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_cond,
result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue,
result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse,
result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f
BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_left,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_right,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c
tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_cond,
tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue,
tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse,
tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c
result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_cond,
result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue,
result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse,
result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c
result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_cond,
result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c
result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l159_c34_9914
CONST_SR_8_uxn_opcodes_h_l159_c34_9914 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l159_c34_9914_x,
CONST_SR_8_uxn_opcodes_h_l159_c34_9914_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc
BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_left,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_right,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2
tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_cond,
tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue,
tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse,
tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2
result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_cond,
result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue,
result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse,
result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2
result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914
BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_8ede
tmp16_MUX_uxn_opcodes_h_l166_c7_8ede : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_return_output);

-- result_pc_MUX_uxn_opcodes_h_l166_c7_8ede
result_pc_MUX_uxn_opcodes_h_l166_c7_8ede : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_cond,
result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue,
result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse,
result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede
result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_cond,
result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e
CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c
BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772
BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_1154
tmp16_MUX_uxn_opcodes_h_l171_c7_1154 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_1154_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_1154_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_return_output);

-- result_pc_MUX_uxn_opcodes_h_l171_c7_1154
result_pc_MUX_uxn_opcodes_h_l171_c7_1154 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l171_c7_1154_cond,
result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iftrue,
result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iffalse,
result_pc_MUX_uxn_opcodes_h_l171_c7_1154_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_cond,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238
BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_left,
BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_right,
BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191
BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_left,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_right,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_return_output);

-- tmp16_MUX_uxn_opcodes_h_l174_c7_d778
tmp16_MUX_uxn_opcodes_h_l174_c7_d778 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l174_c7_d778_cond,
tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iftrue,
tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iffalse,
tmp16_MUX_uxn_opcodes_h_l174_c7_d778_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_return_output);

-- result_pc_MUX_uxn_opcodes_h_l174_c7_d778
result_pc_MUX_uxn_opcodes_h_l174_c7_d778 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l174_c7_d778_cond,
result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iftrue,
result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iffalse,
result_pc_MUX_uxn_opcodes_h_l174_c7_d778_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16
BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_left,
BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_right,
BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec
BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_left,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_right,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
 result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output,
 tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output,
 result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output,
 tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output,
 result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output,
 CONST_SR_8_uxn_opcodes_h_l159_c34_9914_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output,
 tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output,
 result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_return_output,
 result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_1154_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_return_output,
 result_pc_MUX_uxn_opcodes_h_l171_c7_1154_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_return_output,
 tmp16_MUX_uxn_opcodes_h_l174_c7_d778_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_return_output,
 result_pc_MUX_uxn_opcodes_h_l174_c7_d778_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_return_output,
 BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_c746 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_2388 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_b56d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l145_c3_bf2b_uxn_opcodes_h_l145_c3_bf2b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_f9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_2e6d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c24_3879_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_7ca9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_9914_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_9914_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c24_5b0c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l169_c3_3627 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l172_c3_766c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l177_c3_70c7 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b6ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_1f8d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_a8d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_1b9d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l144_l174_DUPLICATE_6083_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_022d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_0c5b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l175_l167_DUPLICATE_8333_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77ce_uxn_opcodes_h_l140_l184_DUPLICATE_5cde_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_2388 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_2388;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_7ca9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_7ca9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_2e6d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_2e6d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_9914_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l157_c11_4a9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_b9a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_1f8d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_1f8d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b6ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b6ba_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_1b9d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_1b9d_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l175_l167_DUPLICATE_8333 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l175_l167_DUPLICATE_8333_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l144_l174_DUPLICATE_6083 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l144_l174_DUPLICATE_6083_return_output := result.pc;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_022d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_022d_return_output := result.ram_addr;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l151_c7_f9b8] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_f9b8_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l155_c24_3879] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c24_3879_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_a8d2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_a8d2_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l162_c11_43bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_0c5b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_0c5b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l174_c11_f191] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_left;
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_return_output := BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_b56d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_0772] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_b914] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c21_e48c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l172_c21_5238] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_left;
     BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_return_output := BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l179_c11_5dec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_left;
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_return_output := BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_b249] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l151_c11_f0c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l159_c34_9914] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l159_c34_9914_x <= VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_9914_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_9914_return_output := CONST_SR_8_uxn_opcodes_h_l159_c34_9914_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b9a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_f0c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_4a9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_43bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_b914_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_0772_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_f191_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_5dec_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_c746 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b249_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l169_c3_3627 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c21_e48c_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l172_c3_766c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c21_5238_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l175_l167_DUPLICATE_8333_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l175_l167_DUPLICATE_8333_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c24_3879_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l144_l174_DUPLICATE_6083_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l144_l174_DUPLICATE_6083_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l144_l174_DUPLICATE_6083_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l144_l174_DUPLICATE_6083_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l144_l174_DUPLICATE_6083_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l144_l174_DUPLICATE_6083_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l144_l174_DUPLICATE_6083_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_022d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_022d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l171_l144_l151_DUPLICATE_022d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_0c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_0c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_0c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_0c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_0c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_0c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_0c5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_a8d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_a8d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_a8d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_a8d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_a8d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_a8d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_a8d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b6ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b6ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b6ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_1f8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_1f8d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_1b9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_1b9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_f9b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_b56d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l169_c3_3627;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l172_c3_766c;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_c746;
     -- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_1154] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_return_output := result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l162_c7_1bd2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_7b1f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_fe1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l144_c1_63b3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_7b1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l159_c24_5b0c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c24_5b0c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c34_9914_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l175_c3_3c16] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_left;
     BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_return_output := BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l151_c7_f9b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_2c1e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_right := VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_3c16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c24_5b0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_2c1e_return_output;
     VAR_printf_uxn_opcodes_h_l145_c3_bf2b_uxn_opcodes_h_l145_c3_bf2b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_63b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_7b1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_1154_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l157_c7_fe1c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output := result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;

     -- printf_uxn_opcodes_h_l145_c3_bf2b[uxn_opcodes_h_l145_c3_bf2b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l145_c3_bf2b_uxn_opcodes_h_l145_c3_bf2b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l145_c3_bf2b_uxn_opcodes_h_l145_c3_bf2b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l166_c7_8ede] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_return_output := result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l174_c7_d778] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l174_c7_d778_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_cond;
     tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iftrue;
     tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_return_output := tmp16_MUX_uxn_opcodes_h_l174_c7_d778_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_d778] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c15_5d4f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_d778] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l151_c7_f9b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_fe1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_5d4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_d778_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_d778_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l166_c7_8ede_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_d778_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l171_c7_1154] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_1154_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_1154_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l162_c7_1bd2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_1154] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_1154] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l151_c7_f9b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l151_c7_f9b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c15_fe82] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l177_c3_70c7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c15_fe82_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_1154_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_1154_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_1154_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iftrue := VAR_result_pc_uxn_opcodes_h_l177_c3_70c7;
     -- tmp16_MUX[uxn_opcodes_h_l166_c7_8ede] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l157_c7_fe1c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l174_c7_d778] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l174_c7_d778_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_cond;
     result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iftrue;
     result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_return_output := result_pc_MUX_uxn_opcodes_h_l174_c7_d778_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_return_output := result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_8ede] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_8ede] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ede_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ede_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l174_c7_d778_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ede_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l151_c7_f9b8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_1bd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l162_c7_1bd2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_cond;
     tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output := tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_1bd2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l171_c7_1154] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l171_c7_1154_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_cond;
     result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iftrue;
     result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_return_output := result_pc_MUX_uxn_opcodes_h_l171_c7_1154_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_1154_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_fe1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l166_c7_8ede] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_cond;
     result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iftrue;
     result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_return_output := result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l157_c7_fe1c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_cond;
     tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output := tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_fe1c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l166_c7_8ede_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l162_c7_1bd2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_cond;
     result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output := result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l151_c7_f9b8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_cond;
     tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output := tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l151_c7_f9b8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l151_c7_f9b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l162_c7_1bd2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l157_c7_fe1c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_cond;
     result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output := result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l157_c7_fe1c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l151_c7_f9b8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_cond;
     result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output := result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l151_c7_f9b8_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l144_c2_b56d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_cond;
     result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_return_output := result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_77ce_uxn_opcodes_h_l140_l184_DUPLICATE_5cde LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77ce_uxn_opcodes_h_l140_l184_DUPLICATE_5cde_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_77ce(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_b56d_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c2_b56d_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77ce_uxn_opcodes_h_l140_l184_DUPLICATE_5cde_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_77ce_uxn_opcodes_h_l140_l184_DUPLICATE_5cde_return_output;
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
