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
-- BIN_OP_EQ[uxn_opcodes_h_l245_c6_0c42]
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l245_c1_a686]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l245_c2_05e2]
signal tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l245_c2_05e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l245_c2_05e2]
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l245_c2_05e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c2_05e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l245_c2_05e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l245_c2_05e2]
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l245_c2_05e2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l245_c2_05e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c2_05e2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l245_c2_05e2]
signal result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l246_c3_c5a4[uxn_opcodes_h_l246_c3_c5a4]
signal printf_uxn_opcodes_h_l246_c3_c5a4_uxn_opcodes_h_l246_c3_c5a4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l251_c11_4b91]
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l251_c7_33b9]
signal tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l251_c7_33b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l251_c7_33b9]
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l251_c7_33b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l251_c7_33b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l251_c7_33b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l251_c7_33b9]
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l251_c7_33b9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l251_c7_33b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l251_c7_33b9]
signal result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l256_c11_9b45]
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l256_c7_34a0]
signal tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l256_c7_34a0]
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l256_c7_34a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l256_c7_34a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l256_c7_34a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l256_c7_34a0]
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l256_c7_34a0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l256_c7_34a0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l256_c7_34a0]
signal result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l259_c11_e350]
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l259_c7_d233]
signal tmp16_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l259_c7_d233]
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l259_c7_d233]
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l259_c7_d233]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l259_c7_d233]
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l259_c7_d233]
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l259_c7_d233]
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l259_c7_d233]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l259_c7_d233]
signal result_pc_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l261_c3_b87c]
signal CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l262_c21_7593]
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l264_c11_0445]
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l264_c7_d101]
signal tmp16_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l264_c7_d101]
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l264_c7_d101]
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l264_c7_d101]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l264_c7_d101]
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l264_c7_d101]
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l264_c7_d101]
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l264_c7_d101]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l264_c7_d101]
signal result_pc_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l265_c21_6ddc]
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l267_c11_fa02]
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l267_c7_1573]
signal tmp16_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l267_c7_1573]
signal result_pc_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l267_c7_1573]
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l267_c7_1573]
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l267_c7_1573]
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l267_c7_1573]
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l267_c7_1573]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l267_c7_1573]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l268_c3_bc19]
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l271_c15_a4e6]
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l273_c11_c341]
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l273_c7_7183]
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l273_c7_7183]
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l273_c7_7183]
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l273_c7_7183]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l273_c7_7183]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l279_c11_506e]
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l279_c7_cfac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l279_c7_cfac]
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l279_c7_cfac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l279_c7_cfac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l281_c34_203e]
signal CONST_SR_8_uxn_opcodes_h_l281_c34_203e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l281_c34_203e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6cad( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.pc := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42
BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_left,
BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_right,
BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_return_output);

-- tmp16_MUX_uxn_opcodes_h_l245_c2_05e2
tmp16_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2
result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l245_c2_05e2
result_pc_MUX_uxn_opcodes_h_l245_c2_05e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_cond,
result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue,
result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse,
result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

-- printf_uxn_opcodes_h_l246_c3_c5a4_uxn_opcodes_h_l246_c3_c5a4
printf_uxn_opcodes_h_l246_c3_c5a4_uxn_opcodes_h_l246_c3_c5a4 : entity work.printf_uxn_opcodes_h_l246_c3_c5a4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l246_c3_c5a4_uxn_opcodes_h_l246_c3_c5a4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91
BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_left,
BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_right,
BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output);

-- tmp16_MUX_uxn_opcodes_h_l251_c7_33b9
tmp16_MUX_uxn_opcodes_h_l251_c7_33b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_cond,
tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue,
tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse,
tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9
result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l251_c7_33b9
result_pc_MUX_uxn_opcodes_h_l251_c7_33b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_cond,
result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue,
result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse,
result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45
BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_left,
BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_right,
BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output);

-- tmp16_MUX_uxn_opcodes_h_l256_c7_34a0
tmp16_MUX_uxn_opcodes_h_l256_c7_34a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_cond,
tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue,
tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse,
tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0
result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_cond,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l256_c7_34a0
result_pc_MUX_uxn_opcodes_h_l256_c7_34a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_cond,
result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue,
result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse,
result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350
BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_left,
BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_right,
BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output);

-- tmp16_MUX_uxn_opcodes_h_l259_c7_d233
tmp16_MUX_uxn_opcodes_h_l259_c7_d233 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l259_c7_d233_cond,
tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iftrue,
tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iffalse,
tmp16_MUX_uxn_opcodes_h_l259_c7_d233_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233
result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_cond,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_cond,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_return_output);

-- result_pc_MUX_uxn_opcodes_h_l259_c7_d233
result_pc_MUX_uxn_opcodes_h_l259_c7_d233 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l259_c7_d233_cond,
result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iftrue,
result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iffalse,
result_pc_MUX_uxn_opcodes_h_l259_c7_d233_return_output);

-- CONST_SL_8_uxn_opcodes_h_l261_c3_b87c
CONST_SL_8_uxn_opcodes_h_l261_c3_b87c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_x,
CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_left,
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_right,
BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445
BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_left,
BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_right,
BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output);

-- tmp16_MUX_uxn_opcodes_h_l264_c7_d101
tmp16_MUX_uxn_opcodes_h_l264_c7_d101 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l264_c7_d101_cond,
tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iftrue,
tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iffalse,
tmp16_MUX_uxn_opcodes_h_l264_c7_d101_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101
result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_cond,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_cond,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_return_output);

-- result_pc_MUX_uxn_opcodes_h_l264_c7_d101
result_pc_MUX_uxn_opcodes_h_l264_c7_d101 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l264_c7_d101_cond,
result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iftrue,
result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iffalse,
result_pc_MUX_uxn_opcodes_h_l264_c7_d101_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_left,
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_right,
BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02
BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_left,
BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_right,
BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output);

-- tmp16_MUX_uxn_opcodes_h_l267_c7_1573
tmp16_MUX_uxn_opcodes_h_l267_c7_1573 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l267_c7_1573_cond,
tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iftrue,
tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iffalse,
tmp16_MUX_uxn_opcodes_h_l267_c7_1573_return_output);

-- result_pc_MUX_uxn_opcodes_h_l267_c7_1573
result_pc_MUX_uxn_opcodes_h_l267_c7_1573 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l267_c7_1573_cond,
result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iftrue,
result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iffalse,
result_pc_MUX_uxn_opcodes_h_l267_c7_1573_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573
result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_cond,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19
BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_left,
BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_right,
BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_left,
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_right,
BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341
BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_left,
BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_right,
BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183
result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_cond,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e
BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_left,
BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_right,
BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac
result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_cond,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_return_output);

-- CONST_SR_8_uxn_opcodes_h_l281_c34_203e
CONST_SR_8_uxn_opcodes_h_l281_c34_203e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l281_c34_203e_x,
CONST_SR_8_uxn_opcodes_h_l281_c34_203e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_return_output,
 tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output,
 tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_return_output,
 result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output,
 tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_return_output,
 result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output,
 tmp16_MUX_uxn_opcodes_h_l259_c7_d233_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_return_output,
 result_pc_MUX_uxn_opcodes_h_l259_c7_d233_return_output,
 CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output,
 tmp16_MUX_uxn_opcodes_h_l264_c7_d101_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_return_output,
 result_pc_MUX_uxn_opcodes_h_l264_c7_d101_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output,
 tmp16_MUX_uxn_opcodes_h_l267_c7_1573_return_output,
 result_pc_MUX_uxn_opcodes_h_l267_c7_1573_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_return_output,
 BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_return_output,
 CONST_SR_8_uxn_opcodes_h_l281_c34_203e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_42f7 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_05e2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l246_c3_c5a4_uxn_opcodes_h_l246_c3_c5a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_33b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l262_c3_4a38 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l265_c3_788a : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l271_c3_ab47 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_eeac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_ccb1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_5880 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_203e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_203e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_f70d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_e6f7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_10a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_53c6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l245_l264_DUPLICATE_60ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l256_l245_l267_l264_l259_DUPLICATE_396b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l256_l251_l245_l273_l264_l259_DUPLICATE_160c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l256_l251_l245_l267_l264_l259_DUPLICATE_1f52_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l256_l251_l279_l273_l267_l264_l259_DUPLICATE_15eb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l268_l260_DUPLICATE_e7b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6cad_uxn_opcodes_h_l288_l240_DUPLICATE_5c0f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_42f7 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l248_c3_42f7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_5880 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l280_c3_5880;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_eeac := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l276_c3_eeac;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_203e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_e6f7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_e6f7_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l281_c34_203e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l281_c34_203e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_203e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_203e_return_output := CONST_SR_8_uxn_opcodes_h_l281_c34_203e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l267_c11_fa02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_left;
     BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output := BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l245_c6_0c42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_left;
     BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output := BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_05e2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l251_c11_4b91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_left;
     BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output := BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l256_c11_9b45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_left;
     BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output := BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l265_c21_6ddc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l264_c11_0445] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_left;
     BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output := BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l271_c15_a4e6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_10a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_10a8_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l262_c21_7593] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_left;
     BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_return_output := BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l256_l245_l267_l264_l259_DUPLICATE_396b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l256_l245_l267_l264_l259_DUPLICATE_396b_return_output := result.is_ram_read;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l277_c24_ccb1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_ccb1_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_53c6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_53c6_return_output := result.stack_address_sp_offset;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_33b9_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l245_l264_DUPLICATE_60ae LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l245_l264_DUPLICATE_60ae_return_output := result.ram_addr;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l268_l260_DUPLICATE_e7b6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l268_l260_DUPLICATE_e7b6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l256_l251_l279_l273_l267_l264_l259_DUPLICATE_15eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l256_l251_l279_l273_l267_l264_l259_DUPLICATE_15eb_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l256_l251_l245_l273_l264_l259_DUPLICATE_160c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l256_l251_l245_l273_l264_l259_DUPLICATE_160c_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l273_c11_c341] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_left;
     BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output := BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l279_c11_506e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_left;
     BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_return_output := BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l259_c11_e350] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_left;
     BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output := BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l256_l251_l245_l267_l264_l259_DUPLICATE_1f52 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l256_l251_l245_l267_l264_l259_DUPLICATE_1f52_return_output := result.pc;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c6_0c42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l251_c11_4b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l256_c11_9b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l259_c11_e350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_0445_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c11_fa02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l273_c11_c341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l279_c11_506e_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l262_c3_4a38 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l262_c21_7593_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l265_c3_788a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l265_c21_6ddc_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l271_c3_ab47 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l271_c15_a4e6_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l268_l260_DUPLICATE_e7b6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l268_l260_DUPLICATE_e7b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l277_c24_ccb1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l256_l251_l245_l267_l264_l259_DUPLICATE_1f52_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l256_l251_l245_l267_l264_l259_DUPLICATE_1f52_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l256_l251_l245_l267_l264_l259_DUPLICATE_1f52_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l256_l251_l245_l267_l264_l259_DUPLICATE_1f52_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l256_l251_l245_l267_l264_l259_DUPLICATE_1f52_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l256_l251_l245_l267_l264_l259_DUPLICATE_1f52_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l245_l264_DUPLICATE_60ae_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l245_l264_DUPLICATE_60ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l256_l251_l279_l273_l267_l264_l259_DUPLICATE_15eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l256_l251_l279_l273_l267_l264_l259_DUPLICATE_15eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l256_l251_l279_l273_l267_l264_l259_DUPLICATE_15eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l256_l251_l279_l273_l267_l264_l259_DUPLICATE_15eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l256_l251_l279_l273_l267_l264_l259_DUPLICATE_15eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l256_l251_l279_l273_l267_l264_l259_DUPLICATE_15eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l256_l251_l279_l273_l267_l264_l259_DUPLICATE_15eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l256_l251_l245_l273_l264_l259_DUPLICATE_160c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l256_l251_l245_l273_l264_l259_DUPLICATE_160c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l256_l251_l245_l273_l264_l259_DUPLICATE_160c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l256_l251_l245_l273_l264_l259_DUPLICATE_160c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l256_l251_l245_l273_l264_l259_DUPLICATE_160c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l256_l251_l245_l273_l264_l259_DUPLICATE_160c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l256_l245_l267_l264_l259_DUPLICATE_396b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l256_l245_l267_l264_l259_DUPLICATE_396b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l256_l245_l267_l264_l259_DUPLICATE_396b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l256_l245_l267_l264_l259_DUPLICATE_396b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l256_l245_l267_l264_l259_DUPLICATE_396b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_10a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_10a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_10a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_10a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_10a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_10a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_10a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_53c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_53c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_53c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_53c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_53c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_53c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_53c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_e6f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_e6f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_e6f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_e6f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_e6f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_e6f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l256_l251_l279_l245_l267_l264_l259_DUPLICATE_e6f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l251_c7_33b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l245_c2_05e2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iftrue := VAR_result_pc_uxn_opcodes_h_l271_c3_ab47;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l262_c3_4a38;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l265_c3_788a;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l264_c7_d101] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_return_output := result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l245_c1_a686] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l281_c24_f70d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_f70d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l281_c34_203e_return_output);

     -- result_is_ram_read_MUX[uxn_opcodes_h_l267_c7_1573] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l267_c7_1573] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l267_c7_1573_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_cond;
     result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iftrue;
     result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_return_output := result_pc_MUX_uxn_opcodes_h_l267_c7_1573_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l279_c7_cfac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l279_c7_cfac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l273_c7_7183] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l268_c3_bc19] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_left;
     BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_return_output := BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l261_c3_b87c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_return_output := CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l279_c7_cfac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l268_c3_bc19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l281_c24_f70d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l261_c3_b87c_return_output;
     VAR_printf_uxn_opcodes_h_l246_c3_c5a4_uxn_opcodes_h_l246_c3_c5a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l245_c1_a686_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l279_c7_cfac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l273_c7_7183_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l267_c7_1573_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l279_c7_cfac_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l267_c7_1573_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l264_c7_d101_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l279_c7_cfac_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l273_c7_7183] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l267_c7_1573] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l267_c7_1573_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_cond;
     tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iftrue;
     tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_return_output := tmp16_MUX_uxn_opcodes_h_l267_c7_1573_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l273_c7_7183] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l279_c7_cfac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_return_output := result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l264_c7_d101] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l264_c7_d101_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_cond;
     result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iftrue;
     result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_return_output := result_pc_MUX_uxn_opcodes_h_l264_c7_d101_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l273_c7_7183] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l264_c7_d101] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l259_c7_d233] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_return_output := result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l267_c7_1573] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_return_output;

     -- printf_uxn_opcodes_h_l246_c3_c5a4[uxn_opcodes_h_l246_c3_c5a4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l246_c3_c5a4_uxn_opcodes_h_l246_c3_c5a4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l246_c3_c5a4_uxn_opcodes_h_l246_c3_c5a4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l273_c7_7183_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l267_c7_1573_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l264_c7_d101_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l273_c7_7183_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l264_c7_d101_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l259_c7_d233_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l273_c7_7183_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l279_c7_cfac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l267_c7_1573_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l264_c7_d101] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l264_c7_d101_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_cond;
     tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iftrue;
     tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_return_output := tmp16_MUX_uxn_opcodes_h_l264_c7_d101_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l267_c7_1573] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l267_c7_1573] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l273_c7_7183] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_cond;
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_return_output := result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l264_c7_d101] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l259_c7_d233] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l267_c7_1573] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l256_c7_34a0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l259_c7_d233] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l259_c7_d233_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_cond;
     result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iftrue;
     result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_return_output := result_pc_MUX_uxn_opcodes_h_l259_c7_d233_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c7_1573_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_d101_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l259_c7_d233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l267_c7_1573_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l259_c7_d233_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l267_c7_1573_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l273_c7_7183_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l264_c7_d101_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l264_c7_d101] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l264_c7_d101] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l259_c7_d233] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l259_c7_d233_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_cond;
     tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iftrue;
     tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_return_output := tmp16_MUX_uxn_opcodes_h_l259_c7_d233_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l256_c7_34a0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_cond;
     result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_return_output := result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l267_c7_1573] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_cond;
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_return_output := result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l264_c7_d101] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l259_c7_d233] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l256_c7_34a0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_d101_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l259_c7_d233_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_d101_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_d101_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l267_c7_1573_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l259_c7_d233_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l259_c7_d233] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l256_c7_34a0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l264_c7_d101] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_cond;
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_return_output := result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l259_c7_d233] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_cond;
     result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_return_output := result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l259_c7_d233] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l256_c7_34a0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_cond;
     tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_return_output := tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l259_c7_d233_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l259_c7_d233_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l259_c7_d233_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_d101_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l256_c7_34a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l256_c7_34a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l259_c7_d233] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_cond;
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_return_output := result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_cond;
     tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_return_output := tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l256_c7_34a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l259_c7_d233_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l256_c7_34a0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_return_output := result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l256_c7_34a0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l251_c7_33b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;

     -- Submodule level 9
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l251_c7_33b9_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l245_c2_05e2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_return_output := result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6cad_uxn_opcodes_h_l288_l240_DUPLICATE_5c0f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6cad_uxn_opcodes_h_l288_l240_DUPLICATE_5c0f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6cad(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c2_05e2_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l245_c2_05e2_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6cad_uxn_opcodes_h_l288_l240_DUPLICATE_5c0f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6cad_uxn_opcodes_h_l288_l240_DUPLICATE_5c0f_return_output;
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
