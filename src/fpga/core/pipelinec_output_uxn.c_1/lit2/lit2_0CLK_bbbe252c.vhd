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
-- Submodules: 85
entity lit2_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_bbbe252c;
architecture arch of lit2_0CLK_bbbe252c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l245_c6_1288]
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l245_c1_e9bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l245_c2_be11]
signal tmp16_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l245_c2_be11]
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c2_be11]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c2_be11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l245_c2_be11]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l245_c2_be11]
signal result_pc_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l245_c2_be11]
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l245_c2_be11]
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l245_c2_be11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l245_c2_be11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l245_c2_be11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l246_c3_ded4[uxn_opcodes_h_l246_c3_ded4]
signal printf_uxn_opcodes_h_l246_c3_ded4_uxn_opcodes_h_l246_c3_ded4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l251_c11_c57b]
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l251_c7_bcf5]
signal tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l251_c7_bcf5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l251_c7_bcf5]
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l251_c7_bcf5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l251_c7_bcf5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l251_c7_bcf5]
signal result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l251_c7_bcf5]
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l251_c7_bcf5]
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l251_c7_bcf5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l251_c7_bcf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l256_c11_8267]
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l256_c7_0601]
signal tmp16_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l256_c7_0601]
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l256_c7_0601]
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l256_c7_0601]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l256_c7_0601]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l256_c7_0601]
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l256_c7_0601]
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l256_c7_0601]
signal result_pc_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l256_c7_0601]
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l259_c11_1ee7]
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l259_c7_334a]
signal tmp16_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l259_c7_334a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l259_c7_334a]
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l259_c7_334a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l259_c7_334a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l259_c7_334a]
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l259_c7_334a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l259_c7_334a]
signal result_pc_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l259_c7_334a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l261_c3_4cae]
signal CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l262_c21_2c38]
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l264_c11_ebe4]
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l264_c7_11d3]
signal tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l264_c7_11d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l264_c7_11d3]
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l264_c7_11d3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l264_c7_11d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l264_c7_11d3]
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l264_c7_11d3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l264_c7_11d3]
signal result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l264_c7_11d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l265_c21_33a2]
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l267_c11_5cca]
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l267_c7_d529]
signal tmp16_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l267_c7_d529]
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l267_c7_d529]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l267_c7_d529]
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l267_c7_d529]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l267_c7_d529]
signal result_pc_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l267_c7_d529]
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l267_c7_d529]
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l268_c3_5c77]
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l271_c15_ce04]
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l273_c11_14db]
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l273_c7_9548]
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l273_c7_9548]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l273_c7_9548]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l273_c7_9548]
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l273_c7_9548]
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l279_c11_a115]
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l279_c7_d00d]
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l279_c7_d00d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l279_c7_d00d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l279_c7_d00d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l281_c34_f58f]
signal CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_30b8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.pc := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_write := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288
BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_left,
BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_right,
BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l245_c2_be11
tmp16_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l245_c2_be11_cond,
tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
tmp16_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_cond,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- result_pc_MUX_uxn_opcodes_h_l245_c2_be11
result_pc_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l245_c2_be11_cond,
result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
result_pc_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11
result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_cond,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

-- printf_uxn_opcodes_h_l246_c3_ded4_uxn_opcodes_h_l246_c3_ded4
printf_uxn_opcodes_h_l246_c3_ded4_uxn_opcodes_h_l246_c3_ded4 : entity work.printf_uxn_opcodes_h_l246_c3_ded4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l246_c3_ded4_uxn_opcodes_h_l246_c3_ded4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b
BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_left,
BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_right,
BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5
tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_cond,
tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue,
tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse,
tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5
result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_cond,
result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue,
result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse,
result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5
result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_cond,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267
BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_left,
BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_right,
BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output);

-- tmp16_MUX_uxn_opcodes_h_l256_c7_0601
tmp16_MUX_uxn_opcodes_h_l256_c7_0601 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l256_c7_0601_cond,
tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iftrue,
tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iffalse,
tmp16_MUX_uxn_opcodes_h_l256_c7_0601_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_cond,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601
result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_cond,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_return_output);

-- result_pc_MUX_uxn_opcodes_h_l256_c7_0601
result_pc_MUX_uxn_opcodes_h_l256_c7_0601 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l256_c7_0601_cond,
result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iftrue,
result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iffalse,
result_pc_MUX_uxn_opcodes_h_l256_c7_0601_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7
BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_left,
BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_right,
BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l259_c7_334a
tmp16_MUX_uxn_opcodes_h_l259_c7_334a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l259_c7_334a_cond,
tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iftrue,
tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iffalse,
tmp16_MUX_uxn_opcodes_h_l259_c7_334a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a
result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_cond,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l259_c7_334a
result_pc_MUX_uxn_opcodes_h_l259_c7_334a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l259_c7_334a_cond,
result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iftrue,
result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iffalse,
result_pc_MUX_uxn_opcodes_h_l259_c7_334a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l261_c3_4cae
CONST_SL_8_uxn_opcodes_h_l261_c3_4cae : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_x,
CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_left,
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_right,
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4
BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_left,
BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_right,
BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l264_c7_11d3
tmp16_MUX_uxn_opcodes_h_l264_c7_11d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_cond,
tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue,
tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse,
tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3
result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_cond,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l264_c7_11d3
result_pc_MUX_uxn_opcodes_h_l264_c7_11d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_cond,
result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue,
result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse,
result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_left,
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_right,
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca
BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_left,
BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_right,
BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l267_c7_d529
tmp16_MUX_uxn_opcodes_h_l267_c7_d529 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l267_c7_d529_cond,
tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iftrue,
tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iffalse,
tmp16_MUX_uxn_opcodes_h_l267_c7_d529_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529
result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_cond,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_return_output);

-- result_pc_MUX_uxn_opcodes_h_l267_c7_d529
result_pc_MUX_uxn_opcodes_h_l267_c7_d529 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l267_c7_d529_cond,
result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iftrue,
result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iffalse,
result_pc_MUX_uxn_opcodes_h_l267_c7_d529_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77
BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_left,
BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_right,
BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_left,
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_right,
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db
BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_left,
BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_right,
BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548
result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_cond,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115
BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_left,
BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_right,
BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d
result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_cond,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l281_c34_f58f
CONST_SR_8_uxn_opcodes_h_l281_c34_f58f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_x,
CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_return_output,
 tmp16_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 result_pc_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output,
 tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output,
 result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output,
 tmp16_MUX_uxn_opcodes_h_l256_c7_0601_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_return_output,
 result_pc_MUX_uxn_opcodes_h_l256_c7_0601_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output,
 tmp16_MUX_uxn_opcodes_h_l259_c7_334a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_return_output,
 result_pc_MUX_uxn_opcodes_h_l259_c7_334a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_return_output,
 CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output,
 tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_return_output,
 result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output,
 tmp16_MUX_uxn_opcodes_h_l267_c7_d529_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_return_output,
 result_pc_MUX_uxn_opcodes_h_l267_c7_d529_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_return_output,
 BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_return_output,
 CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_f325 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_be11_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l246_c3_ded4_uxn_opcodes_h_l246_c3_ded4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_bcf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l262_c3_5e94 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l265_c3_0276 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l271_c3_251e : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_fac6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_e1fd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_44e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_3796_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l245_l264_DUPLICATE_3ccb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l259_l256_l251_l245_l273_DUPLICATE_37d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_1a35_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_5b42_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_acc1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_e8b3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_e92f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l273_DUPLICATE_f275_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_c81e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30b8_uxn_opcodes_h_l240_l288_DUPLICATE_62ad_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_44e2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_44e2;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_right := to_unsigned(3, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_fac6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_fac6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_f325 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_f325;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l259_l256_l251_l245_l273_DUPLICATE_37d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l259_l256_l251_l245_l273_DUPLICATE_37d0_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l271_c15_ce04] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_left;
     BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_return_output := BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l262_c21_2c38] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_left;
     BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_return_output := BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_e8b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_e8b3_return_output := result.is_ram_read;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_be11_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_e92f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_e92f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l259_c11_1ee7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_left;
     BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output := BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_1a35 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_1a35_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l277_c24_e1fd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_e1fd_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_bcf5_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l245_l264_DUPLICATE_3ccb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l245_l264_DUPLICATE_3ccb_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l245_c6_1288] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_left;
     BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output := BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l264_c11_ebe4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_left;
     BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output := BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l256_c11_8267] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_left;
     BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output := BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l281_c34_f58f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_return_output := CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l251_c11_c57b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_left;
     BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output := BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l273_c11_14db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_left;
     BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output := BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_c81e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_c81e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_5b42 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_5b42_return_output := result.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_acc1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_acc1_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l273_DUPLICATE_f275 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l273_DUPLICATE_f275_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l279_c11_a115] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_left;
     BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_return_output := BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l265_c21_33a2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l267_c11_5cca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_left;
     BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output := BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_1288_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_c57b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_8267_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_1ee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_ebe4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_5cca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_14db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_a115_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l262_c3_5e94 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_2c38_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l265_c3_0276 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_33a2_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l271_c3_251e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_ce04_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_c81e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l260_l268_DUPLICATE_c81e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_e1fd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_5b42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_5b42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_5b42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_5b42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_5b42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l245_DUPLICATE_5b42_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l245_l264_DUPLICATE_3ccb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l245_l264_DUPLICATE_3ccb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l273_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l273_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l273_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l273_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l273_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l273_DUPLICATE_f275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l273_DUPLICATE_f275_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l259_l256_l251_l245_l273_DUPLICATE_37d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l259_l256_l251_l245_l273_DUPLICATE_37d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l259_l256_l251_l245_l273_DUPLICATE_37d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l259_l256_l251_l245_l273_DUPLICATE_37d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l259_l256_l251_l245_l273_DUPLICATE_37d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l264_l259_l256_l251_l245_l273_DUPLICATE_37d0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_e8b3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_e8b3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_e8b3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_e8b3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l267_l264_l259_l256_l245_DUPLICATE_e8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_e92f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_e92f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_e92f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_e92f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_e92f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_e92f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_e92f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_1a35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_1a35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_1a35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_1a35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_1a35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_1a35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_1a35_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_acc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_acc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_acc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_acc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_acc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_acc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l267_l264_l259_l256_l251_l279_l245_DUPLICATE_acc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_bcf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_be11_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iftrue := VAR_result_pc_uxn_opcodes_h_l271_c3_251e;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l262_c3_5e94;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l265_c3_0276;
     -- CONST_SL_8[uxn_opcodes_h_l261_c3_4cae] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_x <= VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_return_output := CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l245_c1_e9bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l279_c7_d00d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l273_c7_9548] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l268_c3_5c77] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_left;
     BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_return_output := BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l267_c7_d529] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l267_c7_d529_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_cond;
     result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iftrue;
     result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_return_output := result_pc_MUX_uxn_opcodes_h_l267_c7_d529_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l264_c7_11d3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l279_c7_d00d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l267_c7_d529] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l281_c24_3796] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_3796_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_f58f_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l279_c7_d00d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_5c77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_3796_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_4cae_return_output;
     VAR_printf_uxn_opcodes_h_l246_c3_ded4_uxn_opcodes_h_l246_c3_ded4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_e9bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_d00d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_9548_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_d529_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_d00d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_d529_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_d00d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l273_c7_9548] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_return_output;

     -- printf_uxn_opcodes_h_l246_c3_ded4[uxn_opcodes_h_l246_c3_ded4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l246_c3_ded4_uxn_opcodes_h_l246_c3_ded4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l246_c3_ded4_uxn_opcodes_h_l246_c3_ded4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l267_c7_d529] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l267_c7_d529_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_cond;
     tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iftrue;
     tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_return_output := tmp16_MUX_uxn_opcodes_h_l267_c7_d529_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l279_c7_d00d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_return_output := result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l264_c7_11d3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_cond;
     result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_return_output := result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l267_c7_d529] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l264_c7_11d3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l273_c7_9548] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l259_c7_334a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l273_c7_9548] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_9548_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_d529_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_9548_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_334a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_9548_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_d00d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_d529_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l259_c7_334a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l259_c7_334a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_cond;
     result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_return_output := result_pc_MUX_uxn_opcodes_h_l259_c7_334a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l267_c7_d529] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l267_c7_d529] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l264_c7_11d3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l267_c7_d529] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l256_c7_0601] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_return_output := result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l259_c7_334a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l264_c7_11d3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_cond;
     tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_return_output := tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l273_c7_9548] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_cond;
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_return_output := result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_d529_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_334a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_d529_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_334a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_0601_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_d529_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_9548_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l267_c7_d529] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_cond;
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_return_output := result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l264_c7_11d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l264_c7_11d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l259_c7_334a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l256_c7_0601] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l256_c7_0601_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_cond;
     result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iftrue;
     result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_return_output := result_pc_MUX_uxn_opcodes_h_l256_c7_0601_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l264_c7_11d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l256_c7_0601] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l259_c7_334a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l259_c7_334a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_cond;
     tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_return_output := tmp16_MUX_uxn_opcodes_h_l259_c7_334a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_334a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_0601_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_0601_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_d529_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_334a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l259_c7_334a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l264_c7_11d3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_return_output := result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_cond;
     result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output := result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l256_c7_0601] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l259_c7_334a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l256_c7_0601] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l256_c7_0601_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_cond;
     tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iftrue;
     tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_return_output := tmp16_MUX_uxn_opcodes_h_l256_c7_0601_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_return_output := result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l259_c7_334a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_334a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_0601_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_334a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_334a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_11d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_0601_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l256_c7_0601] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_cond;
     tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output := tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l256_c7_0601] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l259_c7_334a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_return_output := result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_return_output := result_pc_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l256_c7_0601] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_0601_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_0601_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_0601_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_334a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_return_output := tmp16_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l256_c7_0601] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_cond;
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_return_output := result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_0601_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_be11_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l251_c7_bcf5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output := result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- Submodule level 9
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_bcf5_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l245_c2_be11] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_cond;
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_return_output := result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_30b8_uxn_opcodes_h_l240_l288_DUPLICATE_62ad LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30b8_uxn_opcodes_h_l240_l288_DUPLICATE_62ad_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_30b8(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_be11_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_be11_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30b8_uxn_opcodes_h_l240_l288_DUPLICATE_62ad_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30b8_uxn_opcodes_h_l240_l288_DUPLICATE_62ad_return_output;
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
