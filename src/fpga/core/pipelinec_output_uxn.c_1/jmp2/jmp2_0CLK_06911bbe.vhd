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
-- Submodules: 65
entity jmp2_0CLK_06911bbe is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_06911bbe;
architecture arch of jmp2_0CLK_06911bbe is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l525_c6_c238]
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l525_c1_ebdb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l525_c2_073c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l525_c2_073c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l525_c2_073c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l525_c2_073c]
signal result_pc_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l525_c2_073c]
signal result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l525_c2_073c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l525_c2_073c]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l525_c2_073c]
signal result_sp_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l525_c2_073c]
signal t16_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l526_c3_9154[uxn_opcodes_h_l526_c3_9154]
signal printf_uxn_opcodes_h_l526_c3_9154_uxn_opcodes_h_l526_c3_9154_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l528_c16_583c]
signal BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l528_c35_cff6]
signal BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l528_c16_4b04]
signal MUX_uxn_opcodes_h_l528_c16_4b04_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l528_c16_4b04_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l528_c16_4b04_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l528_c16_4b04_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l531_c11_17ea]
signal BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l531_c7_841c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l531_c7_841c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l531_c7_841c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l531_c7_841c]
signal result_pc_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(15 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l531_c7_841c]
signal result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l531_c7_841c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l531_c7_841c]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l531_c7_841c]
signal result_sp_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l531_c7_841c]
signal t16_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l536_c26_c678]
signal BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l538_c11_d199]
signal BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l538_c7_7648]
signal result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l538_c7_7648]
signal result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l538_c7_7648]
signal result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l538_c7_7648]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l538_c7_7648]
signal result_pc_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l538_c7_7648]
signal t16_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l540_c26_0bc0]
signal BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l542_c11_3945]
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l542_c7_4044]
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l542_c7_4044]
signal result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l542_c7_4044]
signal result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l542_c7_4044]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l542_c7_4044]
signal result_pc_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l542_c7_4044]
signal t16_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l544_c3_77dd]
signal CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l546_c26_e998]
signal BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l548_c11_4740]
signal BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l548_c7_fba8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l548_c7_fba8]
signal result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l548_c7_fba8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l548_c7_fba8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l548_c7_fba8]
signal result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l548_c7_fba8]
signal t16_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l550_c26_0698]
signal BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l552_c11_ccb8]
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l552_c7_7826]
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(0 downto 0);

-- result_stack_address_MUX[uxn_opcodes_h_l552_c7_7826]
signal result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(7 downto 0);
signal result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l552_c7_7826]
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l552_c7_7826]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l552_c7_7826]
signal result_pc_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l552_c7_7826]
signal t16_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l553_c3_6112]
signal BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l559_c11_3817]
signal BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l559_c7_af40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l559_c7_af40]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l559_c7_af40]
signal result_pc_MUX_uxn_opcodes_h_l559_c7_af40_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l559_c7_af40_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_132e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.pc := ref_toks_4;
      base.stack_address := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_sp_updated := ref_toks_7;
      base.sp := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238
BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_left,
BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_right,
BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c
result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c
result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l525_c2_073c
result_pc_MUX_uxn_opcodes_h_l525_c2_073c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l525_c2_073c_cond,
result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iftrue,
result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iffalse,
result_pc_MUX_uxn_opcodes_h_l525_c2_073c_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c
result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_cond,
result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c
result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c
result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output);

-- result_sp_MUX_uxn_opcodes_h_l525_c2_073c
result_sp_MUX_uxn_opcodes_h_l525_c2_073c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l525_c2_073c_cond,
result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iftrue,
result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iffalse,
result_sp_MUX_uxn_opcodes_h_l525_c2_073c_return_output);

-- t16_MUX_uxn_opcodes_h_l525_c2_073c
t16_MUX_uxn_opcodes_h_l525_c2_073c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l525_c2_073c_cond,
t16_MUX_uxn_opcodes_h_l525_c2_073c_iftrue,
t16_MUX_uxn_opcodes_h_l525_c2_073c_iffalse,
t16_MUX_uxn_opcodes_h_l525_c2_073c_return_output);

-- printf_uxn_opcodes_h_l526_c3_9154_uxn_opcodes_h_l526_c3_9154
printf_uxn_opcodes_h_l526_c3_9154_uxn_opcodes_h_l526_c3_9154 : entity work.printf_uxn_opcodes_h_l526_c3_9154_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l526_c3_9154_uxn_opcodes_h_l526_c3_9154_CLOCK_ENABLE);

-- BIN_OP_AND_uxn_opcodes_h_l528_c16_583c
BIN_OP_AND_uxn_opcodes_h_l528_c16_583c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_left,
BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_right,
BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6
BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_left,
BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_right,
BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_return_output);

-- MUX_uxn_opcodes_h_l528_c16_4b04
MUX_uxn_opcodes_h_l528_c16_4b04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l528_c16_4b04_cond,
MUX_uxn_opcodes_h_l528_c16_4b04_iftrue,
MUX_uxn_opcodes_h_l528_c16_4b04_iffalse,
MUX_uxn_opcodes_h_l528_c16_4b04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea
BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_left,
BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_right,
BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c
result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c
result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l531_c7_841c
result_pc_MUX_uxn_opcodes_h_l531_c7_841c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l531_c7_841c_cond,
result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iftrue,
result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iffalse,
result_pc_MUX_uxn_opcodes_h_l531_c7_841c_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c
result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_cond,
result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c
result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c
result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output);

-- result_sp_MUX_uxn_opcodes_h_l531_c7_841c
result_sp_MUX_uxn_opcodes_h_l531_c7_841c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l531_c7_841c_cond,
result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iftrue,
result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iffalse,
result_sp_MUX_uxn_opcodes_h_l531_c7_841c_return_output);

-- t16_MUX_uxn_opcodes_h_l531_c7_841c
t16_MUX_uxn_opcodes_h_l531_c7_841c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l531_c7_841c_cond,
t16_MUX_uxn_opcodes_h_l531_c7_841c_iftrue,
t16_MUX_uxn_opcodes_h_l531_c7_841c_iffalse,
t16_MUX_uxn_opcodes_h_l531_c7_841c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678
BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_left,
BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_right,
BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199
BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_left,
BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_right,
BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648
result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648
result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_cond,
result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648
result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648
result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_return_output);

-- result_pc_MUX_uxn_opcodes_h_l538_c7_7648
result_pc_MUX_uxn_opcodes_h_l538_c7_7648 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l538_c7_7648_cond,
result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iftrue,
result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iffalse,
result_pc_MUX_uxn_opcodes_h_l538_c7_7648_return_output);

-- t16_MUX_uxn_opcodes_h_l538_c7_7648
t16_MUX_uxn_opcodes_h_l538_c7_7648 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l538_c7_7648_cond,
t16_MUX_uxn_opcodes_h_l538_c7_7648_iftrue,
t16_MUX_uxn_opcodes_h_l538_c7_7648_iffalse,
t16_MUX_uxn_opcodes_h_l538_c7_7648_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0
BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_left,
BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_right,
BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945
BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_left,
BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_right,
BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044
result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_cond,
result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044
result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044
result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_return_output);

-- result_pc_MUX_uxn_opcodes_h_l542_c7_4044
result_pc_MUX_uxn_opcodes_h_l542_c7_4044 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l542_c7_4044_cond,
result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iftrue,
result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iffalse,
result_pc_MUX_uxn_opcodes_h_l542_c7_4044_return_output);

-- t16_MUX_uxn_opcodes_h_l542_c7_4044
t16_MUX_uxn_opcodes_h_l542_c7_4044 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l542_c7_4044_cond,
t16_MUX_uxn_opcodes_h_l542_c7_4044_iftrue,
t16_MUX_uxn_opcodes_h_l542_c7_4044_iffalse,
t16_MUX_uxn_opcodes_h_l542_c7_4044_return_output);

-- CONST_SL_8_uxn_opcodes_h_l544_c3_77dd
CONST_SL_8_uxn_opcodes_h_l544_c3_77dd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_x,
CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998
BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_left,
BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_right,
BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740
BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_left,
BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_right,
BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8
result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8
result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_cond,
result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8
result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8
result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l548_c7_fba8
result_pc_MUX_uxn_opcodes_h_l548_c7_fba8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_cond,
result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue,
result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse,
result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_return_output);

-- t16_MUX_uxn_opcodes_h_l548_c7_fba8
t16_MUX_uxn_opcodes_h_l548_c7_fba8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l548_c7_fba8_cond,
t16_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue,
t16_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse,
t16_MUX_uxn_opcodes_h_l548_c7_fba8_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698
BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_left,
BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_right,
BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8
BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_left,
BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_right,
BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_return_output);

-- result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826
result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_cond,
result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iftrue,
result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iffalse,
result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826
result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_return_output);

-- result_pc_MUX_uxn_opcodes_h_l552_c7_7826
result_pc_MUX_uxn_opcodes_h_l552_c7_7826 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l552_c7_7826_cond,
result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iftrue,
result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iffalse,
result_pc_MUX_uxn_opcodes_h_l552_c7_7826_return_output);

-- t16_MUX_uxn_opcodes_h_l552_c7_7826
t16_MUX_uxn_opcodes_h_l552_c7_7826 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l552_c7_7826_cond,
t16_MUX_uxn_opcodes_h_l552_c7_7826_iftrue,
t16_MUX_uxn_opcodes_h_l552_c7_7826_iffalse,
t16_MUX_uxn_opcodes_h_l552_c7_7826_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l553_c3_6112
BIN_OP_OR_uxn_opcodes_h_l553_c3_6112 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_left,
BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_right,
BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817
BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_left,
BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_right,
BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40
result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40
result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_return_output);

-- result_pc_MUX_uxn_opcodes_h_l559_c7_af40
result_pc_MUX_uxn_opcodes_h_l559_c7_af40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l559_c7_af40_cond,
result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iftrue,
result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iffalse,
result_pc_MUX_uxn_opcodes_h_l559_c7_af40_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 stack_index,
 ins,
 pc,
 sp,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
 result_pc_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
 result_sp_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
 t16_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_return_output,
 MUX_uxn_opcodes_h_l528_c16_4b04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_return_output,
 result_pc_MUX_uxn_opcodes_h_l531_c7_841c_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output,
 result_sp_MUX_uxn_opcodes_h_l531_c7_841c_return_output,
 t16_MUX_uxn_opcodes_h_l531_c7_841c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_return_output,
 result_pc_MUX_uxn_opcodes_h_l538_c7_7648_return_output,
 t16_MUX_uxn_opcodes_h_l538_c7_7648_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_return_output,
 result_pc_MUX_uxn_opcodes_h_l542_c7_4044_return_output,
 t16_MUX_uxn_opcodes_h_l542_c7_4044_return_output,
 CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_return_output,
 result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_return_output,
 t16_MUX_uxn_opcodes_h_l548_c7_fba8_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_return_output,
 result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_return_output,
 result_pc_MUX_uxn_opcodes_h_l552_c7_7826_return_output,
 t16_MUX_uxn_opcodes_h_l552_c7_7826_return_output,
 BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_return_output,
 result_pc_MUX_uxn_opcodes_h_l559_c7_af40_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l526_c3_9154_uxn_opcodes_h_l526_c3_9154_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l528_c16_4b04_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l528_c16_4b04_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l528_c16_4b04_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l528_c16_4b04_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_uxn_opcodes_h_l533_c3_135a : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l531_c7_841c_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_uxn_opcodes_h_l555_c3_f536 : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l561_c3_e346 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l552_l525_DUPLICATE_021f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l525_l531_DUPLICATE_ea51_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_2c30_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l552_l525_DUPLICATE_a479_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_16f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l542_l538_l531_l559_l552_l548_DUPLICATE_ab33_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l543_l553_DUPLICATE_71e0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_132e_uxn_opcodes_h_l565_l521_DUPLICATE_3560_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_right := to_unsigned(2, 2);
     VAR_result_pc_uxn_opcodes_h_l561_c3_e346 := resize(to_unsigned(0, 1), 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iftrue := VAR_result_pc_uxn_opcodes_h_l561_c3_e346;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_right := to_unsigned(4, 3);
     VAR_result_sp_uxn_opcodes_h_l533_c3_135a := resize(to_unsigned(0, 1), 8);
     VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iftrue := VAR_result_sp_uxn_opcodes_h_l533_c3_135a;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_right := to_unsigned(5, 3);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_uxn_opcodes_h_l555_c3_f536 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iftrue := VAR_result_stack_address_uxn_opcodes_h_l555_c3_f536;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_left := VAR_sp;
     VAR_MUX_uxn_opcodes_h_l528_c16_4b04_iftrue := VAR_sp;
     VAR_BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l542_c11_3945] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_left;
     BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output := BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l531_c11_17ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l552_l525_DUPLICATE_a479 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l552_l525_DUPLICATE_a479_return_output := result.stack_address;

     -- result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l531_c7_841c_return_output := result.is_sp_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l543_l553_DUPLICATE_71e0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l543_l553_DUPLICATE_71e0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_MINUS[uxn_opcodes_h_l540_c26_0bc0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_left;
     BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_return_output := BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_16f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_16f8_return_output := result.is_pc_updated;

     -- BIN_OP_MINUS[uxn_opcodes_h_l528_c35_cff6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_left;
     BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_return_output := BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_2c30 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_2c30_return_output := result.pc;

     -- BIN_OP_MINUS[uxn_opcodes_h_l550_c26_0698] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_left;
     BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_return_output := BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l538_c11_d199] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_left;
     BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output := BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l542_l538_l531_l559_l552_l548_DUPLICATE_ab33 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l542_l538_l531_l559_l552_l548_DUPLICATE_ab33_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l528_c16_583c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_left;
     BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_return_output := BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l548_c11_4740] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_left;
     BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output := BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l559_c11_3817] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_left;
     BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_return_output := BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l525_c6_c238] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_left;
     BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output := BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l552_c11_ccb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l536_c26_c678] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_left;
     BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_return_output := BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l525_l531_DUPLICATE_ea51 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l525_l531_DUPLICATE_ea51_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l552_l525_DUPLICATE_021f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l552_l525_DUPLICATE_021f_return_output := result.is_stack_read;

     -- BIN_OP_MINUS[uxn_opcodes_h_l546_c26_e998] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_left;
     BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_return_output := BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_return_output;

     -- result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l531_c7_841c_return_output := result.sp;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l528_c16_4b04_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l528_c16_583c_return_output, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l525_c6_c238_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l531_c11_17ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l538_c11_d199_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_3945_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l548_c11_4740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_ccb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l559_c11_3817_return_output;
     VAR_MUX_uxn_opcodes_h_l528_c16_4b04_iffalse := VAR_BIN_OP_MINUS_uxn_opcodes_h_l528_c35_cff6_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l536_c26_c678_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l540_c26_0bc0_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l546_c26_e998_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l550_c26_0698_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l543_l553_DUPLICATE_71e0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l543_l553_DUPLICATE_71e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_2c30_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_2c30_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_2c30_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_2c30_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_2c30_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_2c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l542_l538_l531_l559_l552_l548_DUPLICATE_ab33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l542_l538_l531_l559_l552_l548_DUPLICATE_ab33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l542_l538_l531_l559_l552_l548_DUPLICATE_ab33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l542_l538_l531_l559_l552_l548_DUPLICATE_ab33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l542_l538_l531_l559_l552_l548_DUPLICATE_ab33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l542_l538_l531_l559_l552_l548_DUPLICATE_ab33_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_16f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_16f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_16f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_16f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_16f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l542_l538_l531_l525_l559_l548_DUPLICATE_16f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l552_l525_DUPLICATE_021f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l552_l525_DUPLICATE_021f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l525_l531_DUPLICATE_ea51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l525_l531_DUPLICATE_ea51_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l552_l525_DUPLICATE_a479_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_d41d_uxn_opcodes_h_l552_l525_DUPLICATE_a479_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse := VAR_result_is_sp_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_updated_d41d_uxn_opcodes_h_l531_c7_841c_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iffalse := VAR_result_sp_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_sp_d41d_uxn_opcodes_h_l531_c7_841c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l525_c1_ebdb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l544_c3_77dd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_x <= VAR_CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_return_output := CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output;

     -- result_sp_MUX[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l531_c7_841c_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_cond;
     result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iftrue;
     result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_return_output := result_sp_MUX_uxn_opcodes_h_l531_c7_841c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l552_c7_7826] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_return_output;

     -- MUX[uxn_opcodes_h_l528_c16_4b04] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l528_c16_4b04_cond <= VAR_MUX_uxn_opcodes_h_l528_c16_4b04_cond;
     MUX_uxn_opcodes_h_l528_c16_4b04_iftrue <= VAR_MUX_uxn_opcodes_h_l528_c16_4b04_iftrue;
     MUX_uxn_opcodes_h_l528_c16_4b04_iffalse <= VAR_MUX_uxn_opcodes_h_l528_c16_4b04_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l528_c16_4b04_return_output := MUX_uxn_opcodes_h_l528_c16_4b04_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l553_c3_6112] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_left;
     BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_return_output := BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l559_c7_af40] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l552_c7_7826] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_cond;
     result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_return_output := result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l559_c7_af40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l559_c7_af40] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l559_c7_af40_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_cond;
     result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iftrue;
     result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_return_output := result_pc_MUX_uxn_opcodes_h_l559_c7_af40_return_output;

     -- Submodule level 2
     VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l553_c3_6112_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l544_c3_77dd_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iftrue := VAR_MUX_uxn_opcodes_h_l528_c16_4b04_return_output;
     VAR_printf_uxn_opcodes_h_l526_c3_9154_uxn_opcodes_h_l526_c3_9154_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l525_c1_ebdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l559_c7_af40_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l559_c7_af40_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse := VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_7826_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l531_c7_841c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l559_c7_af40_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iffalse := VAR_result_sp_MUX_uxn_opcodes_h_l531_c7_841c_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l552_c7_7826_return_output;
     -- t16_MUX[uxn_opcodes_h_l552_c7_7826] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l552_c7_7826_cond <= VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_cond;
     t16_MUX_uxn_opcodes_h_l552_c7_7826_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_iftrue;
     t16_MUX_uxn_opcodes_h_l552_c7_7826_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_return_output := t16_MUX_uxn_opcodes_h_l552_c7_7826_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l552_c7_7826] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l552_c7_7826_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_cond;
     result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iftrue;
     result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_return_output := result_pc_MUX_uxn_opcodes_h_l552_c7_7826_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l552_c7_7826] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l525_c2_073c] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l525_c2_073c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_return_output;

     -- printf_uxn_opcodes_h_l526_c3_9154[uxn_opcodes_h_l526_c3_9154] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l526_c3_9154_uxn_opcodes_h_l526_c3_9154_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l526_c3_9154_uxn_opcodes_h_l526_c3_9154_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_MUX[uxn_opcodes_h_l525_c2_073c] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l525_c2_073c_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_cond;
     result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iftrue;
     result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_return_output := result_sp_MUX_uxn_opcodes_h_l525_c2_073c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l548_c7_fba8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l552_c7_7826] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l548_c7_fba8] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_cond;
     result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_return_output := result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_7826_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l552_c7_7826_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l552_c7_7826_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l552_c7_7826_return_output;
     -- result_stack_address_MUX[uxn_opcodes_h_l542_c7_4044] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_cond;
     result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_return_output := result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l548_c7_fba8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l542_c7_4044] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l548_c7_fba8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;

     -- t16_MUX[uxn_opcodes_h_l548_c7_fba8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l548_c7_fba8_cond <= VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_cond;
     t16_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue;
     t16_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_return_output := t16_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l548_c7_fba8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_cond;
     result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_return_output := result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l542_c7_4044_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l542_c7_4044_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_iffalse := VAR_t16_MUX_uxn_opcodes_h_l548_c7_fba8_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l542_c7_4044] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l542_c7_4044_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_cond;
     result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iftrue;
     result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_return_output := result_pc_MUX_uxn_opcodes_h_l542_c7_4044_return_output;

     -- t16_MUX[uxn_opcodes_h_l542_c7_4044] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l542_c7_4044_cond <= VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_cond;
     t16_MUX_uxn_opcodes_h_l542_c7_4044_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_iftrue;
     t16_MUX_uxn_opcodes_h_l542_c7_4044_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_return_output := t16_MUX_uxn_opcodes_h_l542_c7_4044_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l538_c7_7648] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l542_c7_4044] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l542_c7_4044] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l538_c7_7648] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_cond;
     result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_return_output := result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_4044_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l542_c7_4044_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l538_c7_7648_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l542_c7_4044_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l538_c7_7648_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_iffalse := VAR_t16_MUX_uxn_opcodes_h_l542_c7_4044_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l538_c7_7648] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_cond;
     result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_return_output := result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l538_c7_7648] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l538_c7_7648] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l538_c7_7648_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_cond;
     result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iftrue;
     result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_return_output := result_pc_MUX_uxn_opcodes_h_l538_c7_7648_return_output;

     -- t16_MUX[uxn_opcodes_h_l538_c7_7648] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l538_c7_7648_cond <= VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_cond;
     t16_MUX_uxn_opcodes_h_l538_c7_7648_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_iftrue;
     t16_MUX_uxn_opcodes_h_l538_c7_7648_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_return_output := t16_MUX_uxn_opcodes_h_l538_c7_7648_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l538_c7_7648_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l538_c7_7648_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l531_c7_841c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l538_c7_7648_return_output;
     VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iffalse := VAR_result_stack_address_MUX_uxn_opcodes_h_l531_c7_841c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l538_c7_7648_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_return_output;

     -- t16_MUX[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l531_c7_841c_cond <= VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_cond;
     t16_MUX_uxn_opcodes_h_l531_c7_841c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_iftrue;
     t16_MUX_uxn_opcodes_h_l531_c7_841c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_return_output := t16_MUX_uxn_opcodes_h_l531_c7_841c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l525_c2_073c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_return_output;

     -- result_stack_address_MUX[uxn_opcodes_h_l525_c2_073c] LATENCY=0
     -- Inputs
     result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_cond <= VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_cond;
     result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iftrue <= VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iftrue;
     result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iffalse <= VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_iffalse;
     -- Outputs
     VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_return_output := result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l531_c7_841c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_cond;
     result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_return_output := result_pc_MUX_uxn_opcodes_h_l531_c7_841c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l531_c7_841c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l531_c7_841c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l531_c7_841c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l531_c7_841c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l531_c7_841c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l525_c2_073c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output;

     -- t16_MUX[uxn_opcodes_h_l525_c2_073c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l525_c2_073c_cond <= VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_cond;
     t16_MUX_uxn_opcodes_h_l525_c2_073c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_iftrue;
     t16_MUX_uxn_opcodes_h_l525_c2_073c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_return_output := t16_MUX_uxn_opcodes_h_l525_c2_073c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l525_c2_073c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l525_c2_073c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_cond;
     result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_return_output := result_pc_MUX_uxn_opcodes_h_l525_c2_073c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l525_c2_073c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_return_output;

     -- Submodule level 8
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l525_c2_073c_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_132e_uxn_opcodes_h_l565_l521_DUPLICATE_3560 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_132e_uxn_opcodes_h_l565_l521_DUPLICATE_3560_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_132e(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
     VAR_result_stack_address_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l525_c2_073c_return_output,
     VAR_result_sp_MUX_uxn_opcodes_h_l525_c2_073c_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_132e_uxn_opcodes_h_l565_l521_DUPLICATE_3560_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_132e_uxn_opcodes_h_l565_l521_DUPLICATE_3560_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
