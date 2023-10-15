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
-- Submodules: 66
entity lit2_0CLK_90fc2573 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_90fc2573;
architecture arch of lit2_0CLK_90fc2573 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l223_c6_a91c]
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l223_c2_c76c]
signal tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l223_c2_c76c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l223_c2_c76c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l223_c2_c76c]
signal result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l223_c2_c76c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l223_c2_c76c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l223_c2_c76c]
signal result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l223_c2_c76c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l223_c2_c76c]
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l223_c2_c76c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l230_c11_4f11]
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l230_c7_f8d7]
signal tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l230_c7_f8d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l230_c7_f8d7]
signal result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l230_c7_f8d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l230_c7_f8d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l230_c7_f8d7]
signal result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l230_c7_f8d7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l230_c7_f8d7]
signal result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l230_c7_f8d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l234_c11_0f73]
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l234_c7_c00c]
signal tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l234_c7_c00c]
signal result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l234_c7_c00c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l234_c7_c00c]
signal result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l234_c7_c00c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l234_c7_c00c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l234_c7_c00c]
signal result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l234_c7_c00c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l236_c3_20bc]
signal CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l237_c21_002f]
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l239_c11_be96]
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l239_c7_2f5a]
signal tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l239_c7_2f5a]
signal result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l239_c7_2f5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l239_c7_2f5a]
signal result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l239_c7_2f5a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l239_c7_2f5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l239_c7_2f5a]
signal result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l239_c7_2f5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l240_c21_3090]
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l242_c11_b6ff]
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l242_c7_37ca]
signal tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l242_c7_37ca]
signal result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_37ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l242_c7_37ca]
signal result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_37ca]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_37ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_37ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l243_c3_091a]
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l245_c15_7812]
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l250_c11_cf4f]
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l250_c7_48b0]
signal result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l250_c7_48b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l250_c7_48b0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l250_c7_48b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l250_c7_48b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l253_c34_4973]
signal CONST_SR_8_uxn_opcodes_h_l253_c34_4973_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l253_c34_4973_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l255_c11_5eec]
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l255_c7_d8c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l255_c7_d8c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c
BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_left,
BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_right,
BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l223_c2_c76c
tmp16_MUX_uxn_opcodes_h_l223_c2_c76c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_cond,
tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue,
tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse,
tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l223_c2_c76c
result_pc_MUX_uxn_opcodes_h_l223_c2_c76c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_cond,
result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue,
result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse,
result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c
result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_cond,
result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c
result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11
BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_left,
BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_right,
BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output);

-- tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7
tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_cond,
tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7
result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_cond,
result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue,
result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse,
result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7
result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_cond,
result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7
result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73
BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_left,
BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_right,
BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output);

-- tmp16_MUX_uxn_opcodes_h_l234_c7_c00c
tmp16_MUX_uxn_opcodes_h_l234_c7_c00c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_cond,
tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue,
tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse,
tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c
result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_cond,
result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l234_c7_c00c
result_pc_MUX_uxn_opcodes_h_l234_c7_c00c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_cond,
result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue,
result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse,
result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c
result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l236_c3_20bc
CONST_SL_8_uxn_opcodes_h_l236_c3_20bc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_x,
CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f
BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_left,
BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_right,
BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96
BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_left,
BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_right,
BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output);

-- tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a
tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_cond,
tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue,
tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse,
tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a
result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_cond,
result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a
result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_cond,
result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue,
result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse,
result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a
result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090
BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_left,
BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_right,
BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff
BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_left,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_right,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l242_c7_37ca
tmp16_MUX_uxn_opcodes_h_l242_c7_37ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_cond,
tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue,
tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse,
tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca
result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_cond,
result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_return_output);

-- result_pc_MUX_uxn_opcodes_h_l242_c7_37ca
result_pc_MUX_uxn_opcodes_h_l242_c7_37ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_cond,
result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue,
result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse,
result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l243_c3_091a
BIN_OP_OR_uxn_opcodes_h_l243_c3_091a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_left,
BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_right,
BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812
BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_left,
BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_right,
BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f
BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_left,
BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_right,
BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0
result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l253_c34_4973
CONST_SR_8_uxn_opcodes_h_l253_c34_4973 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l253_c34_4973_x,
CONST_SR_8_uxn_opcodes_h_l253_c34_4973_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec
BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_left,
BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_right,
BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output,
 tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
 result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output,
 tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output,
 result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output,
 tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_return_output,
 result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_return_output,
 CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output,
 tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output,
 result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output,
 tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_return_output,
 result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_return_output,
 BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_return_output,
 CONST_SR_8_uxn_opcodes_h_l253_c34_4973_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_a239 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_c76c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_f8d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l237_c3_b861 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l240_c3_f36e : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l239_c7_2f5a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_f3dd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l245_c3_e4e7 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c24_495a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_db54 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_4973_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_4973_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c24_8145_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_7cbe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l242_l239_l234_l230_l223_DUPLICATE_5ab7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l255_l250_l239_l234_l230_l223_DUPLICATE_410a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_1055_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_5179_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l255_l250_l242_l239_l234_l230_DUPLICATE_dd3b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_11fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l260_l218_DUPLICATE_4ce4_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_f3dd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_f3dd;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_db54 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_db54;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_a239 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_a239;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_right := to_unsigned(6, 3);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_4973_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_11fa LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_11fa_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_7cbe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_7cbe_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l255_l250_l239_l234_l230_l223_DUPLICATE_410a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l255_l250_l239_l234_l230_l223_DUPLICATE_410a_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_c76c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l255_l250_l242_l239_l234_l230_DUPLICATE_dd3b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l255_l250_l242_l239_l234_l230_DUPLICATE_dd3b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l255_c11_5eec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_left;
     BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_return_output := BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l253_c34_4973] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l253_c34_4973_x <= VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_4973_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_4973_return_output := CONST_SR_8_uxn_opcodes_h_l253_c34_4973_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l230_c7_f8d7] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_f8d7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l250_c11_cf4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l237_c21_002f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_5179 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_5179_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l223_c6_a91c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_left;
     BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output := BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l239_c11_be96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_left;
     BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output := BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l234_c11_0f73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_left;
     BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output := BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l242_c11_b6ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l230_c11_4f11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_left;
     BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output := BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l239_c7_2f5a] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l239_c7_2f5a_return_output := result.ram_addr;

     -- BIN_OP_PLUS[uxn_opcodes_h_l240_c21_3090] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_left;
     BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_return_output := BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_1055 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_1055_return_output := result.stack_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l245_c15_7812] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_left;
     BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_return_output := BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l242_l239_l234_l230_l223_DUPLICATE_5ab7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l242_l239_l234_l230_l223_DUPLICATE_5ab7_return_output := result.pc;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_a91c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_4f11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_0f73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_be96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_b6ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_cf4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_5eec_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l237_c3_b861 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_002f_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l240_c3_f36e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_3090_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l245_c3_e4e7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_7812_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_11fa_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_11fa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l242_l239_l234_l230_l223_DUPLICATE_5ab7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l242_l239_l234_l230_l223_DUPLICATE_5ab7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l242_l239_l234_l230_l223_DUPLICATE_5ab7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l242_l239_l234_l230_l223_DUPLICATE_5ab7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l242_l239_l234_l230_l223_DUPLICATE_5ab7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l255_l250_l242_l239_l234_l230_DUPLICATE_dd3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l255_l250_l242_l239_l234_l230_DUPLICATE_dd3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l255_l250_l242_l239_l234_l230_DUPLICATE_dd3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l255_l250_l242_l239_l234_l230_DUPLICATE_dd3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l255_l250_l242_l239_l234_l230_DUPLICATE_dd3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l255_l250_l242_l239_l234_l230_DUPLICATE_dd3b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_5179_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_5179_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_5179_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_5179_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_5179_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l255_l250_l239_l234_l230_l223_DUPLICATE_410a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l255_l250_l239_l234_l230_l223_DUPLICATE_410a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l255_l250_l239_l234_l230_l223_DUPLICATE_410a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l255_l250_l239_l234_l230_l223_DUPLICATE_410a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l255_l250_l239_l234_l230_l223_DUPLICATE_410a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l255_l250_l239_l234_l230_l223_DUPLICATE_410a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_7cbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_7cbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_7cbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_7cbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_7cbe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_1055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_1055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_1055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_1055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l250_l239_l234_l230_l223_DUPLICATE_1055_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_f8d7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l239_c7_2f5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_c76c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue := VAR_result_pc_uxn_opcodes_h_l245_c3_e4e7;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l237_c3_b861;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l240_c3_f36e;
     -- result_pc_MUX[uxn_opcodes_h_l242_c7_37ca] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_cond;
     result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue;
     result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_return_output := result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l250_c7_48b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l253_c24_8145] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c24_8145_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_4973_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l255_c7_d8c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l239_c7_2f5a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l243_c3_091a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_left;
     BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_return_output := BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l255_c7_d8c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l230_c7_f8d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l250_c7_48b0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l236_c3_20bc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_return_output := CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c24_8145_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_20bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_48b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_d8c1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_48b0_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_37ca] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l248_c24_495a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c24_495a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_091a_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l250_c7_48b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l250_c7_48b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l239_c7_2f5a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_cond;
     result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output := result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_37ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l242_c7_37ca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_cond;
     tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_return_output := tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l234_c7_c00c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l250_c7_48b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c24_495a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_48b0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_48b0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_48b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_37ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l239_c7_2f5a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_cond;
     tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output := tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l230_c7_f8d7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l239_c7_2f5a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l234_c7_c00c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_cond;
     result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_return_output := result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l239_c7_2f5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_37ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l242_c7_37ca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_return_output := result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_37ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l239_c7_2f5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l230_c7_f8d7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_cond;
     result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output := result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l239_c7_2f5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l234_c7_c00c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l239_c7_2f5a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output := result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l234_c7_c00c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l234_c7_c00c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_cond;
     tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_return_output := tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_2f5a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l230_c7_f8d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l230_c7_f8d7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l234_c7_c00c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l230_c7_f8d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_cond;
     tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output := tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_cond;
     result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_return_output := result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l234_c7_c00c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l234_c7_c00c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_return_output := result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_c00c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l230_c7_f8d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l230_c7_f8d7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output := result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_cond;
     tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_return_output := tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l230_c7_f8d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_f8d7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_return_output := result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l223_c2_c76c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l260_l218_DUPLICATE_4ce4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l260_l218_DUPLICATE_4ce4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_610b(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_c76c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_c76c_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l260_l218_DUPLICATE_4ce4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l260_l218_DUPLICATE_4ce4_return_output;
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
